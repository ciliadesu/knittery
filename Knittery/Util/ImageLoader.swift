//
//  ImageLoader.swift
//  Knittery
//
//  Created by Cecilia Valenti on 2021-02-23.
//  Copyright © 2021 Cecilia Valenti. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var downloadedImage: UIImage?
    
    public func load(url: String) {
        
        guard let imageURL = URL(string: url) else {
            fatalError("ImageURL is not correct!")
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            
            guard let data = data, error == nil else {
                print("Error loading image data")
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedImage = UIImage(data: data)
            }
            
        }.resume()
        
    }
}
