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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PatternDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PatternDetailView(PatternDetailViewModel(patternId: 1234, currentUser: CurrentUser()))
    }
}
