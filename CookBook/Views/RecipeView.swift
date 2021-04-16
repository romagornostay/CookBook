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
                    VStack(spacing: 10) {
                        
                        BackButton()
                        
                        RecipeImages(recipe: recipe)
                        
                        Text(recipe.instructions)
                            .padding(.horizontal)
                            .font(.system(size: 16, weight: .semibold))
                            .multilineTextAlignment(.center)
                        Text("last updated: \(recipe.lastUpdated)")
                            .italic()
                    }
                }//.navigationBarTitle(recipe.name, displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
