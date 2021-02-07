//
//  ContentView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-10.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI
import OAuthSwift

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView: View {
    @EnvironmentObject var currentUser: CurrentUser
    
    var body: some View  {
        Group {
            if currentUser.isLoggedIn {
                NavView()
            } else {
                LoginView()
            }
            
        }
    }
}





