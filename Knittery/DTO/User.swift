//
//  User.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-13.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import Foundation

struct User: Codable {
    let username: String
}

struct CurrentUserDTO: Codable {
    let user: User
}


