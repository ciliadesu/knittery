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
    @ObservedObject var userModel = UserViewModel()

    init() {
        if userModel.networkManager.tokenHandler.accessTokenExists() {
            userModel.networkManager.refreshAccessToken()
//            userModel.networkManager.tokenHandler.deleteToken(ofType: .access)
        }
    }
    
    var body: some View  {
        ZStack {
            if userModel.networkManager.tokenHandler.accessTokenExists() {
                NavView()
            } else {
                LoginView()
            }
        }
    }
}


struct LoginView: View {
    let networkManager = NetworkManager()
    var body: some View {
        ZStack {
            Color.hotPink
                .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .center){
                Image(Constants.yarn)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.beige, lineWidth: 3))
                Text("Welcome to Knittery!")
                    .font(.title)
                    .foregroundColor(.beige)
                Text("Login to get started.")
                    .foregroundColor(.beige)
                    .padding(.bottom, 10)
                
                Button(action: {
                    self.networkManager.auth()
                }) {
                    Text("Log in")
                        .padding()
                        .background(Color.beige)
                        .foregroundColor(Color.hotPink)
                        .cornerRadius(15)
                }
                .padding()
            }
        }
    }
}




