//
//  FullScreenImagesView.swift
//  CookBook
//
//  Created by SalemMacPro on 15.4.21.
//

import SwiftUI
import Kingfisher

struct FullScreenImagesView: View {
    
    var recipe: Recipe
    
    @State private var isLoading = false
    @ObservedObject var viewModel : ImagesViewModel
    @State private var uiImage: UIImage?
    @ObservedObject private var imageSaver = ImageSaver()
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.viewModel = ImagesViewModel(recipe: recipe)
    }
    
    var body: some View {
        
        ZStack {
            if recipe.images != nil {
                TabView {
                    ForEach(recipe.images!.indices, id:\.self) { num in
                        KFImage(URL(string:recipe.images![num]))
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fit)
                            .tag(num)
                            .contextMenu {
                                Button("Save Image") {
                                    self.imageSaver.saveImage(viewModel.images[num])
                                }
                            }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .onAppear { viewModel.fetchUIImage() }
            } else {
                if viewModel.imagesURL != nil {
                    LoadingView()
                } 
            }
            if self.imageSaver.isSaving {
                LoadingView()
            }
        }
    }
}

struct FullScreenImagesView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenImagesView(recipe: Recipe(id: nil, uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Pan Roasted Chicken with Lemon", image: nil, images: [
            "https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/goat-cheese-rolled-in-dried-cr-216282.jpg",
            "https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/goat-cheese-rolled-in-dried-cranber.jpg", "https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/deviled-eggs-12.jpg"
        ], lastUpdated: nil, description: nil, instructions: nil, difficulty: nil, similar: nil))
    }
}


