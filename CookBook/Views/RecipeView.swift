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
    @Environment(\.presentationMode) var presentationMode
    
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
                    VStack(spacing: 10) {
                        Button { presentationMode.wrappedValue.dismiss() }
                            label: {
                                HStack {
                                    Image(systemName: "chevron.left").font(.largeTitle)
                                    Text("Back")
                                    Spacer()
                                }
                                .foregroundColor(.black)
                                .padding(5)
                            }
                        
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
