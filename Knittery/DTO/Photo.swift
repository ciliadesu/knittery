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
    let squareURL: String
    let thumbnailURL: String
    let mediumURL: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case smallURL = "small_url"
        case squareURL = "square_url"
        case thumbnailURL = "thumbnail_url"
        case mediumURL = "medium_url"
        case id
    }
}
