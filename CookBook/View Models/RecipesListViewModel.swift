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
    @Published var appError: AppError?
    @Published var isLoading = false
    @Published var isError = false
    private let apiManager = APIManager()
    private var subscriber: AnyCancellable?
    private var recipesSubject = PassthroughSubject<RecipesList, Error>()
    
    func filter(_ array: [Recipe], text: String) -> [Recipe]{
        var recipesList = array
        recipesList = recipes.filter({text.isEmpty ? true : "\($0)".contains(text.lowercased())})
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
                self?.recipesSubject.send(value)
            case .failure(let error):
                self?.recipesSubject.send(completion: .failure(error))
            }
        }
       subscriber = recipesSubject.sink { (resultComplection) in
            switch resultComplection {
            case .failure(let error) :
                self.isError = true
                self.appError = AppError(errorString: error.localizedDescription)
                print(error.localizedDescription)
            default: break
            }
        
        } receiveValue: { (value) in
            DispatchQueue.main.async {
                print(value)
                self.recipes = value.recipes
                self.isError = false
                self.isLoading = false
            }
        }
    }
}


    
