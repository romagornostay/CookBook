//
//  FullScreenImages.swift
//  CookBook
//
//  Created by SalemMacPro on 15.4.21.
//

import SwiftUI
import Kingfisher

struct FullScreenImages: View {
    
    
    var recipe: Recipe
    
    @ObservedObject var viewModel : ImagesViewModel
    @State private var uiImage: UIImage?
    private var imageSaver = ImageSaver()
    
    

    // MARK: Initializers
    init(recipe: Recipe) {
        self.recipe = recipe
        self.viewModel = ImagesViewModel(recipe: recipe)
    }
    
    var body: some View {
        
        //Image(uiImage: <#T##UIImage#>)
        
        
        
        TabView() {
            ForEach(recipe.images.indices, id:\.self) { num in
                KFImage(URL(string:recipe.images[num]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .tag(num)
                    .contextMenu {
                        Button("Save Image"){self.imageSaver.saveImage(viewModel.images[num])}
                    }
            }
            
        }.tabViewStyle(PageTabViewStyle())
    }
}

