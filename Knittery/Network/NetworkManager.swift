//
//  NetworkManager.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-13.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import Foundation
import OAuthSwift
import SwiftUI
import Combine


class NetworkManager {
        
    var oauthswift: OAuth2Swift
    var callback: ((String) -> Void)?
    var result: ((Codable) -> Void)?
    var tokenHandler = TokenHandler()
    
    init() {
        oauthswift = OAuth2Swift(
            consumerKey:    Keys.consumerKey,
            consumerSecret: Keys.consumerSecret,
            authorizeUrl:   "https://www.ravelry.com/oauth2/auth",
            accessTokenUrl: "https://www.ravelry.com/oauth2/token",
            responseType:   "code"
        )
    }
    
    public func auth() {
        
        oauthswift.client.credential.headersFactory = XHeaders(credential: oauthswift.client.credential)
        oauthswift.allowMissingStateCheck = true

        let _ = oauthswift.authorize (
            withCallbackURL: "knitteryapp://oauth-callback",
            scope: "offline",
            state: "goodoldmeowykitties"
        ) { result in
            switch result {
            case .success(let (credential, _, _)):
                
                if self.tokenHandler.storeToken(credential.oauthToken, ofType: .access) {
                    print("Stored access token: \(credential.oauthToken)")
                } else {
                    print("Failed to store access token")
                }
                
                if credential.oauthRefreshToken != "" {
                    if self.tokenHandler.storeToken(credential.oauthRefreshToken, ofType: .refresh) {
                        print("Stored refresh token: \(credential.oauthRefreshToken)")
                    } else {
                        print("Failed to store refresh token")
                    }
                } else {
                    print("No refresh token found")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    public func refreshAccessToken() {
        if let token = tokenHandler.getToken(ofType: .refresh) {
            oauthswift.client.credential.headersFactory = XHeaders(credential: oauthswift.client.credential)
            oauthswift.allowMissingStateCheck = true
            oauthswift.renewAccessToken(withRefreshToken: token) { result in
                switch result {
                case .success(let response):
                    print("Successfully refreshed token")
                    
                    self.tokenHandler.storeToken(response.credential.oauthToken, ofType: .access)
                    self.tokenHandler.storeToken(response.credential.oauthRefreshToken, ofType: .refresh)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    public func fetchUser() {
        if let url = URL(string: "https://api.ravelry.com/current_user.json") {
            performNetworkRequest(url: url, type: CurrentUser.self)
        }
    }
    
    public func fetchFavorites(for user: String) {
        //GET /people/{username}/favorites/list.json
        if let url = URL(string: "https://api.ravelry.com/people/\(user)/favorites/list.json?types=pattern") {
            print(url)
            performNetworkRequest(url: url, type: FavoritesList.self)
        }
    }
    
    private func performNetworkRequest<T>(url: URL, type: T.Type) where T : Codable {
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        
        guard let token = tokenHandler.getToken(ofType: .access) else { return }
        let responseToken = "Bearer: \(token)"
        request.addValue(responseToken, forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                let decoder = JSONDecoder()
                if let safeData = data {
                    do {
                        let result = try decoder.decode(type, from: safeData)
                        DispatchQueue.main.async {
                            self.result?(result)
                        }
                        print("Fetched data: \(result)")
                    } catch {
                        print(error)
                    }
                }
            }
        }
        task.resume()
    }
    
}
