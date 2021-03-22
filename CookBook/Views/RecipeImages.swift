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
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common)
    
    @State private var currentIndex = 0
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            ForEach(recipe.images, id:\.self) { url in
                KFImage(URL(string:url))
                    .resizable()
                    .scaledToFill()
                    .tag(recipe.lastUpdated)
                    

            }
        }
        .tabViewStyle(PageTabViewStyle())
        .overlay(RecipePhotoText(recipe: recipe), alignment: .bottom)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(8)
        .onReceive(timer) { _ in
            withAnimation { currentIndex = currentIndex < recipe.images.count ? currentIndex + 1 : 0 }
        }
    }
}

struct RecipeImages_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
