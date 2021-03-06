//
//  Pattern.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

struct PatternDTO: Codable {
    let pattern: Pattern
}

struct Pattern: Codable, Identifiable {
    let id: Int
    let name: String
    let attributes: [PatternAttribute]?
    let firstPhoto: Photo?
    let patternAuthor: PatternAuthor
    let photos: [Photo]?
    let notes: String?
    let yarnWeight: YarnWeight?
    
    enum CodingKeys: String, CodingKey {
        case attributes = "pattern_attributes"
        case firstPhoto = "first_photo"
        case patternAuthor = "pattern_author"
        case yarnWeight = "yarn_weight"
        
        case id, name, photos, notes
    }
}

struct PatternAttribute: Codable {
    let description: String?
}
