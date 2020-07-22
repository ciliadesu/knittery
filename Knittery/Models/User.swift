//
//  User.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-13.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import Foundation

struct CurrentUser: Codable {
    let user: User
    //let description: String
}

struct User: Codable {
    let username: String
}
