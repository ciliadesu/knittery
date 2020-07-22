//
//  xHeaders.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-19.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import Foundation
import OAuthSwift


class XHeaders: OAuthSwiftCredentialHeadersFactory {
    let credential: OAuthSwiftCredential
    init(credential: OAuthSwiftCredential) {
        self.credential = credential
    }
    
    func make(_ url:URL, method: OAuthSwiftHTTPRequest.Method, parameters: OAuthSwift.Parameters, body: Data?) -> [String:String] {
          if credential.oauthToken.isEmpty {
             let loginString = String(format: "%@:%@", credential.consumerKey, credential.consumerSecret)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            
            return ["Authorization":"Basic \(base64LoginString)"]

        }
        return   ["Authorization": "Bearer \(credential.oauthToken)"]
    }
}
