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
    
    init() {
        self.viewModel = FavoritesViewModel()
    }
    
    var body: some View {
        ZStack {
            content
        }
        
        .onAppear {
            viewModel.handle(.onAppear(currentUser))
        }
        .navigationBarTitle("Favorites", displayMode: .large)
    }
    
    var content: some View {
        
        switch viewModel.currentState {
        case .idle:
            return AnyView(Color.clear)
        case .loading:
            return AnyView(ProgressView())
        case .loaded(let patterns):
            return AnyView(list(of: patterns))
        case .error(let error):
            return AnyView(Text("An error occured: \(error.localizedDescription)"))
        }
    }
    
    func list(of patterns: [Pattern]) -> some View {
        NavigationView {
            List(patterns) { item in
                NavigationLink(
                    destination: PatternDetailView(PatternDetailViewModel(patternId: item.id, currentUser: currentUser))
                ) {
                    ListItemView(ListItemViewModel(currentUser: currentUser, item: item))
                }
            }
        }
        .navigationTitle("Favorites")
    }
}

struct FavoritesView_Previews: PreviewProvider {

    static var previews: some View {
        FavoritesView()
    }
}
