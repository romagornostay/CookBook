//
//  ImagesViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 15.4.21.
//

import Foundation
import UIKit

class ImagesViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    var imagesURL: [String]
    
    init(recipe: Recipe) {
        self.imagesURL = recipe.images!
        self.fetchUIImage()
    }

    private func fetchUIImage() {
        for url in imagesURL {
            DispatchQueue.global(qos: .background).async {
                guard let url = URL(string: url) else { return }
                URLSession.shared.dataTask(with: url) {
                    (data, responce, error) in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    if let data = data {
                        self.getUIImages(data)
                    }
                    
                }.resume()
            }
        }
    }
    
    private func getUIImages(_ data: Data) {
        DispatchQueue.main.async {
            self.images.append(UIImage(data: data)!)
        }
    }
}
