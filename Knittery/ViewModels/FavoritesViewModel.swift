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
    enum Action {
        case loading
    }
    
    let currentUser: CurrentUser
    
    @Published var favorites: [Pattern] = []
    
    init(_ currentUser: CurrentUser) {
        
        self.currentUser = currentUser
    }
    
    func loadBookmarks() {
        
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
                    self?.favorites = dto.favorites.map { $0.favorited }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
