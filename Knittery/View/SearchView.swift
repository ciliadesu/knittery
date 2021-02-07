//
//  SearchView.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2020-06-11.
//  Copyright © 2020 Cecilia Valenti. All rights reserved.
//

import SwiftUI
import Combine

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchView: View {
    @State var searchText: String = ""
    @ObservedObject var searchViewModel = SearchViewModel()
    
    init() {
        UINavigationBar.appearance()
            .largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            
            ZStack {

                VStack{
                    Divider()
                    SearchBar(text: $searchText)
                    Spacer()
                    Text("Some buttons here")
                    Spacer()
                    NavigationLink(destination: SearchResultsView(searchText)) {
                        HStack (alignment: .bottom) {
                                Spacer()
                            Image(systemName: "magnifyingglass")
                                .padding()
                                .background(Color.beige)
                                .foregroundColor(Color.pineGreen)
                                .cornerRadius(15)
                                .imageScale(.large)
                        }
                    .padding(25)
                    }
                    Divider()
                }
            }
            .navigationBarTitle("Search", displayMode: .inline)
        }
        
    }
}



struct SearchResultsView: View {
    let searchString: String
    
    init(_ searchString: String) {
        self.searchString = searchString
    }
    
    var body: some View {
        ZStack{
            Text(searchString)
        }
    }
}



//struct SearchResultRow: View {
//    var body: some View {
//
//        HStack(spacing: 0) {
//            Rectangle()
//                .stroke(Color.beige, lineWidth: 3)
//                .padding(8)
//                .frame(height: 200)
//            Rectangle()
//                .stroke(Color.beige, lineWidth: 3)
//                .padding(8)
//        }
//
//    }
//}
