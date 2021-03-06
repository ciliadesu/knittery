//
//  Pattern.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

struct Pattern: Codable, Identifiable {
    let id: Int
    let name: String
    let attributes: [PatternAttribute]?
    let firstPhoto: Photo?
    let patternAuthor: PatternAuthor
    
    enum CodingKeys: String, CodingKey {
        case attributes = "pattern_attributes"
        case firstPhoto = "first_photo"
        case patternAuthor = "pattern_author"
        
        case id, name
    }
}

struct PatternAttribute: Codable {
    let description: String
}
