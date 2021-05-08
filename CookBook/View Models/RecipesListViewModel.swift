//
//  RecipesListViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Combine
import Foundation

final class RecipesListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    @Published var isLoading = false
    @Published var isError = false
    
    private let apiManager = APIManager()
    private let recipesSubject = PassthroughSubject<RecipesList, Error>()
    
    func filter(text: String) -> [Recipe]{
       let recipesList = recipes.filter({text.isEmpty ? true : "\($0)".contains(text.lowercased())})
        return recipesList
    }
    
    func sortByName() {
        let sortedArray = recipes.sorted(by: {$0.name < $1.name})
        self.recipes = sortedArray
    }
    
    func sortByLastUpdated() {
        let sortedArray = recipes.sorted(by: {$0.lastUpdated!<$1.lastUpdated!})
        self.recipes = sortedArray
    }
    
    func fetchRecipesList() {
        self.isError = false
        self.isLoading = true
        guard let url = KodeAPI.url(.recipes) else { return }
        
        apiManager.fetchItems(url: url) { [weak self] (result: Result<RecipesList, Error>) in
            switch result {
            case .success(let value):
                self?.handleResult(value)
            case .failure(let error):
                self?.handleError(error)
            }
        }
    }
    private func handleResult(_ result: RecipesList) {
        recipes = result.recipes
        isError = false
        isLoading = false
        recipesSubject.send(result)
    }
    
    private func handleError(_ error: Error) {
        isError = true
        recipesSubject.send(completion: .failure(error))
    }
}


