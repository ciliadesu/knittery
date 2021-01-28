//
//  FavoritesView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-11.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    
    @EnvironmentObject var userStatus: AuthStatus
    
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack (alignment: .leading){
                Button(action: {
                    let model = FavoritesViewModel(userStatus)
                }, label: {
                    Text("Load favorites")
                        .padding()
                        .background(Color.beige)
                        .foregroundColor(Color.orange)
                        .cornerRadius(15)
                        .imageScale(.large)
                })
            }
        }
    }
}

