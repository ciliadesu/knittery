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
            .foregroundColor(.beige)
    }
}

struct StartView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    init() {
        viewModel.networkManager.fetchUser()
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.hotPink
                    .edgesIgnoringSafeArea(.all)
                
                VStack (alignment: .center){
                    Image(Constants.yarn)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.beige, lineWidth: 3))
                    TitleText(text: "Welcome to Knittery2!")
                    Text("Welcome to Knittery!")
                        .font(.title)
                        .foregroundColor(.beige)
                    Text("You are logged in as: \(viewModel.username)")
                        .foregroundColor(.beige)
                    Text("Tap Search to get started.")
                        .foregroundColor(.beige)
                        .padding(.bottom, 10)
                    NavigationLink(destination: LogOutView()) {
                        HStack (alignment: .bottom) {
                            Text("Log out")
                                .padding()
                                .background(Color.beige)
                                .foregroundColor(Color.hotPink)
                                .cornerRadius(15)
                                .imageScale(.large)
                        }
                        .padding(25)
                    }
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
