//
//  UserStatus.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

class AuthStatus: ObservableObject {
    
    @Published var username: String = ""
    @Published var isLoggedIn: Bool = false
    
    let networkManager: NetworkManager
    
    init() {
        networkManager = NetworkManager()
        
        if networkManager.tokenHandler.accessTokenExists() {
            networkManager.refreshAccessToken()
        }
        
        networkManager.result = { [weak self] result in
            if let currentUser = result as? CurrentUser {
                self?.username = currentUser.user.username
            }
            self?.isLoggedIn = true
        }
        
        networkManager.fetchUser()
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
