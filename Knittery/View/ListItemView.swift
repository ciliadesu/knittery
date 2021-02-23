//
//  ListItemView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    
    @ObservedObject var viewModel: ListItemViewModel
    
    init(_ viewModel: ListItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack{
            URLImage(url: viewModel.pattern.firstPhoto?.smallURL ?? "")
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
            Text(viewModel.pattern.name)
        }
        
    }
}

//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItemView(ListItemViewModel(currentUser: CurrentUser(),
//                                       item: Pattern(id: 12345, name: "Mock pattern")))
//    }
//}
