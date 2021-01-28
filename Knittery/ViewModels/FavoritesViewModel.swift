//
//  FavoritesViewModel.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import SwiftUI

class FavoritesViewModel {
    let userStatus: AuthStatus
    
    init(_ userStatus: AuthStatus) {
        self.userStatus = userStatus
        loadFavorites()
    }
    
    private func loadFavorites() {
        userStatus.networkManager.fetchFavorites(for: userStatus.username)
        
        userStatus.networkManager.result = { result in
            guard let faves = result as? FavoritesList else { return }
            print("Successfully fetched favorites list")
        }
    }
    
    
}
