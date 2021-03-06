//
//  PatternDetailViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-03-06.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation

class PatternDetailViewModel: ViewModel {
    
    @Published var currentState: State = .idle
    
    private let patternId: Int
    private let currentUser: CurrentUser
    
    init(patternId: Int, currentUser: CurrentUser) {
        self.patternId = patternId
        self.currentUser = currentUser
    }
    
    func handle(_ action: Action) {
        switch action {
        
        case .onAppear:
            currentState = .loading
            fetchPattern()
        }
    }
    
    enum State {
        case idle
        case loading
        case loaded
        case error(Error)
        
        func description() -> String {
            switch self {
            case .idle: return "idle"
            case .loading: return "loading"
            case .loaded: return "loaded"
            case .error(_): return "error"
            }
        }
    }
    
    enum Action {
        case onAppear
    }
    
    private func fetchPattern() {
        
    }
    
}
