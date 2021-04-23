//
//  RecipeView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI
import Kingfisher

struct RecipeView: View {
    
    @ObservedObject var viewModel : RecipeViewModel
    
    
    init(recipe: Recipe) {
        self.viewModel = RecipeViewModel(meal: recipe)
    }
    
    @ViewBuilder var body: some View {
        if self.viewModel.recipe == nil {
            Text("Recipe Not Found")
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        else {
            self.viewModel.recipe.map { recipe in
                ScrollView {
                    VStack() {
                        
                        //BackButtonView()
                        
                        RecipeImagesView(recipe: recipe)
                        
                        VStack(alignment: .leading ,spacing: 10) {
                            
                            RecipeNameView(recipe: recipe)
                            
                            DescriptionView(recipe: recipe)
                            
                            DifficultyRatingView(recipe: recipe)
                            
                            InstructionView(recipe: recipe)
                        }.padding(.horizontal, 24)
                        
                        RecommendedView(recipe: recipe).padding(.leading,8)
                        
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
