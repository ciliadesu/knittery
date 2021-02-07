//
//  Pattern.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

struct Pattern: Codable, Identifiable {
//    let created_at: String
    let id: Int
    let name: String
//    let pattern_author: PatternAuthor
    let pattern_attributes: [PatternAttribute]?
    let first_photo: Photo?
}

struct PatternAttribute: Codable {
    let description: String
}
