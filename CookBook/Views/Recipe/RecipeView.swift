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
    
    // MARK: Initializers
    init(recipe: Recipe) {
        self.viewModel = RecipeViewModel(recipe: recipe)
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
                    VStack(alignment: .leading ,spacing: 10) {
                        
                       // BackButton()
                        
                        RecipeImages(recipe: recipe)
                        
                        RecipeName(recipe: recipe)
                        
                        Description(recipe: recipe)
                        
                        DifficultyRating(recipe: recipe)
                        
                        Instruction(recipe: recipe)
                        
                        Recommended(recipe: recipe)
                    
                    }.background(Color.yellow)
                    .padding(.horizontal, 24)
                    .background(Color.green)
                }
                .navigationBarTitle("", displayMode: .inline)
            
                //.navigationBarHidden(true)
                
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}