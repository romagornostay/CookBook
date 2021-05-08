//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 20.03.2021.
//

import Combine
import Foundation

final class RecipeViewModel: ObservableObject {
    
    @Published var recipe: Recipe!
    @Published var isLoading = false
    @Published var isError = false
    
    private let apiManager = APIManager()
    private let recipeSubject = PassthroughSubject<RecipeDetails, Error>()
    private let recipeFromList: Recipe
    
    init(recipe: Recipe) {
        self.recipeFromList = recipe
    }
    
    func fetchRecipe() {
        guard let url = KodeAPI.url(.recipe(id: recipeFromList.uuid)) else { return }
        apiManager.fetchItems(url: url) { [weak self] (result: Result<RecipeDetails, Error>) in
            switch result {
            case .success(let value):
                self?.handleResult(value)
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    private func handleResult(_ result: RecipeDetails) {
        recipe = result.recipe
        isError = false
        isLoading = false
        recipeSubject.send(result)
    }
    
    private func handleError(_ error: Error) {
        isError = true
        recipeSubject.send(completion: .failure(error))
    }
}






