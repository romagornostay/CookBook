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
    
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    @State private var currentIndex = 0
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            ForEach(0..<recipe.images.count, id:\.self) { num in
                KFImage(URL(string:recipe.images[num]))
                    .resizable()
                    .scaledToFill()
                    .tag(num)
                    

            }
        }
        .tabViewStyle(PageTabViewStyle())
        .overlay(RecipePhotoText(recipe: recipe), alignment: .bottom)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(10)
        .onReceive(timer) { _ in
            withAnimation { currentIndex = currentIndex < recipe.arrayOfImages.count ? currentIndex + 1 : 0 }
        }
    }
}

struct RecipeImages_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
