//
//  LogOutView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-21.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct LogOutView_Previews: PreviewProvider {
    static var previews: some View {
        LogOutView()
    }
}


struct LogOutView: View {
    let networkManager = NetworkManager()
    
    var body: some View {
        
        ZStack {
            VStack {
                Text("You have been logged out")
            }
        }
    }
    
    private func performDelete() {
        if networkManager.tokenHandler.deleteToken(ofType: .access) {
            print("Deleted access token")
        }
        
        if networkManager.tokenHandler.deleteToken(ofType: .refresh) {
            print("Deleted refresh token")
        }
        
        if networkManager.tokenHandler.accessTokenExists() {
            print("Access token still exists")
        } else {
            print("No access token")
        }
    }
    
}
