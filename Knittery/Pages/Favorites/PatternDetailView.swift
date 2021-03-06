//
//  PatternDetailView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-03-06.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct PatternDetailView: View {
    
    @ObservedObject var viewModel: PatternDetailViewModel
    
    init(_ viewModel: PatternDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        content
            .onAppear {
                viewModel.handle(.onAppear)
            }
    }
    
    var content: some View {
        switch viewModel.currentState {
        
        case .idle:
            return AnyView(Color.clear)
        case .loading:
            return AnyView(ProgressView())
        case .loaded(let pattern):
            return AnyView(patternView(pattern))
        case .error(let error):
            return AnyView(Text("An error occured: \(error.localizedDescription)"))
        }
    }
    
    private func patternView(_ pattern: Pattern) -> some View {
        ScrollView {
            URLImage(url: pattern.photos?.first?.mediumURL ?? "")
            
            
                Text(pattern.name)
                    .font(.largeTitle)
                Text("By: \(pattern.patternAuthor.name)")
                    .font(.subheadline)
            
            
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Pattern info")
                        .font(.headline)
                    Text("Yarn weight: \(pattern.yarnWeight?.name ?? "")")
                }
                .padding()
            }
            .background(Color.beige)
            .cornerRadius(20)
            .padding()
            

                Text(pattern.notes ?? "")
                    .padding()

        }
        
    }
}

struct PatternDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PatternDetailView(PatternDetailViewModel(patternId: 1234, currentUser: CurrentUser()))
    }
}
