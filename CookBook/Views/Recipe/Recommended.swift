//
//  Recommended.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI
import Kingfisher

struct Recommended: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended:")
                .foregroundColor(Color(.systemRed))
                .font(.system(size: 18, weight: .regular))
                .frame(width: 128, height: 21, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                HStack {
                    ForEach(0..<20) { index in
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            KFImage(recipe.imageURL)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                                
                        }
                            
                            .frame(width: 200, height: 110)
                            .shadow(radius: 5)
                            .padding(6)
                        
                    }
                }
            }
        }
    }
}
