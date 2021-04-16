//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 20.03.2021.
//

import Foundation


class RecipeViewModel: ObservableObject {
    
    @Published var recipe: Recipe?
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}


