//
//  ListItemView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-01-30.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import SwiftUI

struct ListItemView: View {
    let viewModel: ListItemViewModel
    init(_ viewModel: ListItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.pattern.name)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
    }
}

//struct ListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItemView(ListItemViewModel(currentUser: CurrentUser(),
//                                       item: Pattern(id: 12345, name: "Mock pattern")))
//    }
//}
