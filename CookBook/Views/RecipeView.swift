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
                    VStack {
                        RecipeImages(recipe: recipe)
                            .padding(5)
                        Text(recipe.instructions)
                            .padding(.horizontal)
                            .font(.system(size: 16, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("last updated: \(recipe.lastUpdated)")
                            .italic()
                    }
                }.navigationBarTitle(recipe.name, displayMode: .inline)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
