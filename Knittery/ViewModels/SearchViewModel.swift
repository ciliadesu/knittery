//
//  SearchViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchResults: [String]
    
    init() {
        searchResults = []
    }
    
    public func performSearch() {
        print("Search!")
    }
}
