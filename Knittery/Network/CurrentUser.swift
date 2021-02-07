//
//  CurrentUser.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

class CurrentUser: ObservableObject {
    
    @Published var username: String = ""
    @Published var isLoggedIn: Bool = false
    
    let networkManager: NetworkManager
    
    init() {
        networkManager = NetworkManager()
        
        if networkManager.tokenHandler.accessTokenExists() {
            networkManager.refreshAccessToken()
        }
        
        guard let request = networkManager.requestBuilder(URL.currentUser) else {
            print("Could not build request")
            return
        }
        
        networkManager.makeRequest(request) { (result: Result<CurrentUserDTO, RequestError>) in
            switch result {
            case .success(let dto):
                DispatchQueue.main.async {
                    self.username = dto.user.username
                    self.isLoggedIn = true
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func logOut() {
        if networkManager.tokenHandler.deleteToken(ofType: .access) {
            print("Deleted access token")
        }
        
        if networkManager.tokenHandler.deleteToken(ofType: .refresh) {
            print("Deleted refresh token")
        }
        
        if networkManager.tokenHandler.accessTokenExists() {
            print("Access token still exists")
        } else {
            print("No access token remaining")
        }
        
        isLoggedIn = false
    }
}
