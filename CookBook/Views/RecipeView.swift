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
    
    init(meal: Recipe) {
        self.viewModel = RecipeViewModel(meal: meal)
    }
    
    var body: some View {
        if self.viewModel.recipe == nil {
            Text("Recipe Not Found")
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        else {
            self.viewModel.recipe.map { recipe in
                ScrollView {
                    VStack {
                        RecipeImages(recipe: recipe)
                        
                        Text(recipe.instructions)
                            .padding(10)
                            .background(Color.white.opacity(0.1)).clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Text("last updated: \(recipe.lastUpdated)")
                            .italic()
                           
                    }
                }
                .navigationBarTitle(recipe.name, displayMode: .inline)

            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
