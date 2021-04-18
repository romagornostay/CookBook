//
//  Recommended.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI
import Kingfisher

struct Recommended: View {
    @ObservedObject var viewModel = RecommendedViewModel()
    var body: some View {
        VStack(alignment: .leading) {
            Text("Recommended:")
                .font(.system(size: 18, weight: .regular))
                .frame(width: 128, height: 21, alignment: .leading)
                .padding(.horizontal, 24)
                .padding(.top,16)
            //Shuffled horizontal list of recipes
            ScrollView(.horizontal, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/) {
                HStack {
                    ForEach(viewModel.recipes.shuffled(), id: \.self) { recipe in
                        
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            ZStack{
                                KFImage(recipe.imageURL)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                Color.black.opacity(0.3)
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
                                        .foregroundColor(Color(.systemBackground))
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
