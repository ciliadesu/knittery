//
//  LoginView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-28.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import SwiftUI


struct LoginView: View {
    let networkManager = NetworkManager()
    var body: some View {
        ZStack {
            
            VStack (alignment: .center){
                Image(Constants.Images.yarn)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.beige, lineWidth: 3))
                Text("Welcome to Knittery!")
                    .font(.title)
                    .foregroundColor(.hotPink)
                Text("Login to get started.")
                    .foregroundColor(.hotPink)
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
