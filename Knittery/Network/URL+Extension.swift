//
//  URL+Extension.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-02-06.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

extension URL {
    
    static let currentUser = URL(string: "https://api.ravelry.com/current_user.json")!
    
    static func favorites(_ user: String) -> URL? {
        URL(string: "https://api.ravelry.com/people/\(user)/favorites/list.json?types=pattern")
    }
    
    static func patterns(ids: [Int]) -> URL? {
        let idString = ids.map { String($0) }.joined(separator: "+")
        return URL(string: "https://api.ravelry.com/patterns.json?ids=\(idString)")
    }
    
    static func fetchPattern(with id: Int) -> URL? {
        return URL(string: "https://api.ravelry.com/patterns/\(id).json")
    }
}
/*
 //    public func fetchUser() {
 //        if let url = URL(string: "https://api.ravelry.com/current_user.json") {
 //            print("Attempting to fetch user...")
 //            performNetworkRequest(url: url, type: CurrentUserDTO.self)
 //        }
 //    }
 //
 //    public func fetchFavorites(for user: String) {
 //        //GET /people/{username}/favorites/list.json
 //        if let url = URL(string: "https://api.ravelry.com/people/\(user)/favorites/list.json?types=pattern") {
 //            print(url)
 //            performNetworkRequest(url: url, type: FavoritesList.self)
 //        }
 //    }
 //
     
 //    public func fetchPatterns(with ids: [Int]) {
 //        // Make query string with id+id+id
 //        // patterns.json?ids=600+601
 //        let idString = ids.map { String($0) }.joined(separator: "+")
 //        if let url = URL(string: "https://api.ravelry.com/patterns.json?ids=\(idString)") {
 //            print(url)
 //            performNetworkRequest(url: url, type: [Pattern].self )
 //        }
 //    }
 */
