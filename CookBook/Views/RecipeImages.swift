//
//  RecipeImages.swift
//  CookBook
//
//  Created by SalemMacPro on 21.03.2021.
//

import SwiftUI
import Kingfisher

struct RecipeImages: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        TabView() {
            ForEach(recipe.images.indices, id:\.self) { num in
                KFImage(URL(string:recipe.images[num]))
                    .resizable()
                    .scaledToFill()
                    .tag(num)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        //.overlay(RecipePhotoText(recipe: recipe), alignment: .bottom)
        
    }
}

struct RecipeImages_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
