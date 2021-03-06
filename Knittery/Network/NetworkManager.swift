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


public enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case decodingError
}

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
    
    public func requestBuilder(_ url: URL) -> URLRequest? {
        var request = URLRequest(url: url)
        guard let token = tokenHandler.getToken(ofType: .access) else {
            print("Could not get access token")
            return nil
        }
        let responseToken = "Bearer: \(token)"
        request.addValue(responseToken, forHTTPHeaderField: "Authorization")
        return request
    }
    
    public func makeRequest<T: Codable>(_ request: URLRequest, resultHandler: @escaping (Result<T, RequestError>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                resultHandler(.failure(.clientError))
                return
            }
            
            guard let r = response as? HTTPURLResponse, 200...299 ~= r.statusCode else {
                print(response.debugDescription)
                resultHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                resultHandler(.failure(.noData))
                return
            }
            
            /* Uncomment the following to print out the entire JSON response */
//            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
//                resultHandler(.failure(.decodingError))
//                return
//            }
//            print("JSON:", json)
            
            guard let decoded: T = self.decodedData(data) else {
                resultHandler(.failure(.decodingError))
                return
            }
            
            resultHandler(.success(decoded))
            
        }
        task.resume()
    }
    
    private func decodedData<T: Codable>(_ data: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: data)
    }
    
}

