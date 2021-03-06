//
//  XHeadersTests.swift
//  KnitteryTests
//
//  Created by Cecilia Valenti on 2020-06-11.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import XCTest
@testable import Knittery
@testable import OAuthSwift

class XHeadersTests: XCTestCase {

    func testBasic() throws {
        let xHeaders = XHeaders(credential: OAuthSwiftCredential())
        let header = xHeaders.make(URL.currentUser,
                                 method: .GET,
                                 parameters: .init(),
                                 body: nil)
        let expectedResult: [String: String] = [
            "Authorization": "Basic Og=="
        ]
        
        XCTAssertEqual(header, expectedResult)
    }
    
    func testBearer() {
        
        let credential = OAuthSwiftCredential(consumerKey: "mockKey",
                                              consumerSecret: "mockSecret")
        credential.oauthToken = "mockToken"
        let xHeaders = XHeaders(credential: credential)
        let header = xHeaders.make(URL.currentUser,
                                 method: .GET,
                                 parameters: .init(),
                                 body: nil)
        let expectedResult: [String: String] = [
            "Authorization": "Bearer mockToken"
        ]
        
        XCTAssertEqual(header, expectedResult)
        
    }

}
