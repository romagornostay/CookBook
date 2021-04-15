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
    var body: some View {
        TabView() {
            ForEach(recipe.images.indices, id:\.self) { num in
                KFImage(URL(string:recipe.images[num]))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //.scaledToFill()
                    .tag(num)
            }
            
        }.tabViewStyle(PageTabViewStyle())
    }
}

