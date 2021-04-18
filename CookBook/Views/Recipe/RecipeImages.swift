//
//  RecipeImages.swift
//  CookBook
//
//  Created by SalemMacPro on 21.03.2021.
//

import SwiftUI
import Kingfisher

struct RecipeImages: View {
    
    @State var showImage: Bool = false
    
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            TabView() {
                ForEach(recipe.images.indices, id:\.self) { num in
                    KFImage(URL(string:recipe.images[num]))
                        .resizable()
                        .scaledToFill()
                        .tag(num)
                }
                
            }
            .aspectRatio(contentMode: .fill)
            .padding(.vertical, 5)
            .background(Color.red)
            .tabViewStyle(PageTabViewStyle())
            .onTapGesture { showImage.toggle() }
           
        }.sheet(isPresented: $showImage, content: {FullScreenImages(recipe: recipe)})
    }
}

struct RecipeImages_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
