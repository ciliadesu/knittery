//
//  TokenHandler.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-19.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

struct TokenHandler {
    
    enum TokenType: String {
        case access = "knitteryAccessToken"
        case refresh = "knitteryRefreshToken"
    }
    
    
    @discardableResult public func storeToken(_ token: String, ofType: TokenType) -> Bool {
        return KeychainWrapper.standard.set(token, forKey: ofType.rawValue)
    }
    
    @discardableResult  public func getToken(ofType: TokenType) -> String? {
        return  KeychainWrapper.standard.string(forKey: ofType.rawValue)
    }
    
    @discardableResult public func deleteToken(ofType: TokenType) -> Bool {
        return KeychainWrapper.standard.removeObject(forKey: ofType.rawValue)
    }
    
    public func accessTokenExists() -> Bool {
        if let _ = getToken(ofType: .access) {
            return true
        } else {
            return false
        }
    }
}
