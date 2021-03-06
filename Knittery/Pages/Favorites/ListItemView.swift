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
        content
            .onAppear{
                viewModel.handle(.onAppear)
            }
    }
    
    var content: some View {
        
            switch viewModel.currentState {
            case .idle:
                return AnyView(Color.clear)
            case .loading:
                return AnyView(ProgressView())
            case .loaded:
                return AnyView(imgView)
            }
    }
    
    var imgView: some View {
        HStack(spacing: 5) {
            URLImage(url: viewModel.pattern.firstPhoto?.smallURL ?? "")
                .scaledToFit()
                .frame(width: 100, height: 75, alignment: .leading)
            VStack(alignment: .leading) {
                Text(viewModel.pattern.name)
                    .bold()
                Text("by: \(viewModel.pattern.patternAuthor.name)")
            }
        }
        .padding(10)
    }
}

struct ListItemView_Previews: PreviewProvider {
   
    static var previews: some View {
        
        ListItemView(ListItemViewModel(currentUser: CurrentUser(),
                                       item: MockData.pattern))
    }
}
