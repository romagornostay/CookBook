//
//  RecipeImagesView.swift
//  CookBook
//
//  Created by SalemMacPro on 21.03.2021.
//

import SwiftUI
import Kingfisher

struct RecipeImagesView: View {
    
    var recipe: Recipe
    @State private var showImage: Bool = false
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var body: some View {
       ZStack {
        TabView {
            ForEach(recipe.images!.indices, id:\.self) { num in
                    KFImage(URL(string:recipe.images![num]))
                        .resizable()
                        .scaledToFill()
                        .tag(num)
            }
        }
        .aspectRatio(contentMode: .fit)
        .tabViewStyle(PageTabViewStyle())
        .onTapGesture { showImage.toggle() }
           
       }
       .sheet(isPresented: $showImage, content: { FullScreenImagesView(recipe: recipe) })
    }
}

struct RecipeImages_Previews: PreviewProvider {
    static var previews: some View {
        RecipeImagesView(recipe: Recipe(id: nil, uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Pan Roasted Chicken with Lemon", image: nil, images: ["https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/deviled-eggs-12.jpg",
            "https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/goat-cheese-rolled-in-dried-cr-216282.jpg",
            "https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/goat-cheese-rolled-in-dried-cranber.jpg"
          ], lastUpdated: nil, description: nil, instructions: nil, difficulty: nil, similar: nil))
    }
}
