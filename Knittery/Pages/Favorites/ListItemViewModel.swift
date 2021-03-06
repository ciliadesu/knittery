//
//  ListItemViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

class ListItemViewModel: ViewModel {
    let currentUser: CurrentUser
    @Published var currentState: State = .idle
    
    let pattern: Pattern
    
    init(currentUser: CurrentUser, item: Pattern) {
        self.currentUser = currentUser
        self.pattern = item
    }
    
    func handle(_ action: Action) {
        switch action {
        case .onAppear:
            currentState = .loaded
        }
    }
    
    enum State {
        case idle
        case loading
        case loaded

        func description() -> String {
            switch self {
            case .idle: return "idle"
            case .loading: return "loading"
            case .loaded: return "loaded"
            }
        }
    }
    
    enum Action {
        case onAppear
    }
    
}
