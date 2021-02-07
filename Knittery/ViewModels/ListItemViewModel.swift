//
//  ListItemViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

class ListItemViewModel: ViewModel {
    
    enum Action {
        case loading
    }
    
    let currentUser: CurrentUser
    
    @Published var pattern: Pattern
    
    init(currentUser: CurrentUser, item: Pattern) {
        self.currentUser = currentUser
        self.pattern = item
    }
    
}
