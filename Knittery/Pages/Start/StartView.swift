//
//  StartView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-11.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI
import Combine

struct TitleText : View {
    let text: String
    init(text: String) {
        self.text = text
    }
    var body: some View {
        Text(text)
            .font(.title)
    }
}

struct StartView: View {
    
    @EnvironmentObject var currentUser: CurrentUser
    
    var body: some View {
        NavigationView{
            ZStack {
                
                VStack (alignment: .center){
                    Image(Constants.Images.yarn)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.beige, lineWidth: 3))
                    Text("Welcome to Knittery!")
                        .font(.title)
                        .foregroundColor(.ksuPurple)
                    Text("You are logged in as: \(currentUser.username)")
                        .foregroundColor(.ksuPurple)
                    Text("Tap Search to get started.")
                        .foregroundColor(.ksuPurple)
                        .padding(.bottom, 10)
                    Button(action: {
                        currentUser.logOut()
                    }, label: {
                        Text("Log out")
                            .padding()
                            .background(Color.beige)
                            .foregroundColor(Color.ksuPurple)
                            .cornerRadius(15)
                            .imageScale(.large)
                    })
                    .padding(25)
                }
            }
        }
    }
}



struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
