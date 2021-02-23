//
//  Photo.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-02-07.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let smallURL: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case smallURL = "small_url"
        case id
    }
}
