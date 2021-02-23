//
//  URLImage.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-02-23.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation
import SwiftUI

struct URLImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    
    var placeholder: Image
    
    init(url: String, placeholder: Image = Image(systemName: "photo")) {
        self.placeholder = placeholder
        self.imageLoader.load(url: url)
    }
    
    var body: some View {
        if let loadedImage = self.imageLoader.downloadedImage {
            return Image(uiImage: loadedImage)
                .resizable()
        } else {
            return placeholder
        }
    }
}
