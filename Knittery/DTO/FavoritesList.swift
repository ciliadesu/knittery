//
//  FavoritesList.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

struct FavoritesList: Codable {
    let favorites: [Bookmark]
    let paginator: Paginator
}

struct Bookmark: Codable, Identifiable {
    let id: Int
    let type: String
    let favorited: Pattern
}


