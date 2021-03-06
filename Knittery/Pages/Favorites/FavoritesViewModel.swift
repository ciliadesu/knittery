//
//  FavoritesViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import SwiftUI
import Combine

class FavoritesViewModel: ViewModel {

    @Published var currentState: State = .idle
    
    func handle(_ action: Action) {
        switch action {
        
        case .onAppear(let currentUser):
            currentState = .loading
            loadBookmarks(currentUser)
        }
    }
    
    enum State {
        case idle
        case loading
        case loaded([Pattern])
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
        case onAppear(CurrentUser)
    }
    
    private func loadBookmarks(_ currentUser: CurrentUser) {
        
        guard
            let url = URL.favorites(currentUser.username),
            let request = currentUser.networkManager.requestBuilder(url) else {
            print("Could not build request")
            return
        }

        currentUser.networkManager.makeRequest(request) { [weak self] (result: Result<FavoritesList, RequestError>) in
            switch result {
            case .success(let dto):
                DispatchQueue.main.async {
                    print(dto)
                    let patterns = dto.favorites.map { $0.favorited }
                    self?.currentState = .loaded(patterns)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
