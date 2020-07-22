//
//  NavView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-14.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        TabView {
            StartView()
                .tabItem {
                    Image(systemName: "house.fill")
                        .imageScale(.large)
                    Text(Constants.home)
            }
            
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                        .imageScale(.large)
                    Text(Constants.search)
            }
            
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                        .imageScale(.large)
                    Text(Constants.favorites)
            }
        }
        .accentColor(.hotPink)
    }
    
}

struct NavView_Previews: PreviewProvider {
    static var previews: some View {
        NavView()
    }
}
