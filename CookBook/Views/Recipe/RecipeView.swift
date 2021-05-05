//
//  RecipeView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct RecipeView: View {
    
    @ObservedObject var viewModel : RecipeViewModel
    
    init(recipe: Recipe) {
        self.viewModel = RecipeViewModel(recipe: recipe)
        viewModel.fetchRecipe()
    }
    
    @ViewBuilder var body: some View {
        if self.viewModel.recipe == nil {
            //NoInternetView(viewModel: <#Binding<RecipesListViewModel>#>)
        }
        else {
            self.viewModel.recipe.map { recipe in
                ScrollView {
                    VStack {
                        RecipeImagesView(recipe: viewModel.recipe!)
                        
                        VStack(alignment: .leading ,spacing: 10) {
                            
                            RecipeNameView(recipe: viewModel.recipe!)
                            
                            DescriptionView(recipe: viewModel.recipe!)
                            
                            DifficultyRatingView(recipe: viewModel.recipe!)
                            
                            InstructionView(recipe: viewModel.recipe!)
                        }
                        .padding(.horizontal, 24)
                        
                        RecommendedView(recipe: viewModel.recipe!).padding(.leading,8)
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
