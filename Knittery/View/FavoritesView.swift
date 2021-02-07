//
//  FavoritesView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-11.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var currentUser: CurrentUser
    @ObservedObject var viewModel: FavoritesViewModel
    
    init(viewModel: FavoritesViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        NavigationView {
            VStack (alignment: .leading) {
                List(viewModel.favorites) { item in
                    ListItemView(ListItemViewModel(currentUser: currentUser, item: item))
                }
            }
            .navigationBarTitle("Favorites", displayMode: .large)
        }
        .onAppear {
            print("On appear!")
            viewModel.loadBookmarks()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: FavoritesViewModel(CurrentUser()))
    }
}
