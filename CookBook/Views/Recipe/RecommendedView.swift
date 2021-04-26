//
//  RecommendedView.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI
import Kingfisher

struct RecommendedView: View {
    
    var recipes: [Recipe]
    
    init(recipe: Recipe) {
        self.recipes = recipe.similar!
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if !recipes.isEmpty {
                Text("Recommended:")
                    .foregroundColor(Color("AdaptiveColor1"))
                    .font(.system(size: 18, weight: .regular))
                    .padding(.horizontal, 16)
                    .padding(.top,16)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recipes, id: \.self) { recipe in
                        
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            ZStack{
                                if let stringURL = recipe.image {
                                    let url = URL(string: stringURL)
                                    KFImage(url)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                    Color.black.opacity(0.4)
                                }
                            }
                        }
                        .frame(width: 200, height: 110)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding(.bottom, 10)
                        .padding(.leading, 8)
                        .overlay(
                            VStack {
                                HStack {
                                    Text(recipe.name)
                                        .foregroundColor(Color(.white))
                                        .font(.subheadline)
                                        .padding(.horizontal)
                                    Spacer()
                                }
                                
                                Spacer()
                                
                            }
                        )
                    }
                }
            }
        }
    }
}

