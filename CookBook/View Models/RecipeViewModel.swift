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
    @Published var noData = false
    private let apiManager = APIManager()
    private var subscriber: AnyCancellable?
    private var recipeSubject = PassthroughSubject<RecipeDetails, Error>()
    private var recipeFromList: Recipe
    
    init(recipe: Recipe) {
        self.recipeFromList = recipe
    }
    
    func fetchRecipe() {
        
        guard let url = KodeAPI.url(.recipe(id: recipeFromList.uuid)) else { return }
        apiManager.fetchItems(url: url) { [weak self] (result: Result<RecipeDetails, Error>) in
            switch result {
            case .success(let value):
                self?.recipeSubject.send(value)
            case .failure(let error):
                self?.recipeSubject.send(completion: .failure(error))
            }
        }
       subscriber = recipeSubject.sink { (resultComplection) in
            switch resultComplection {
            case .failure(let error) : print(error.localizedDescription)
            default: break
            }
        
        } receiveValue: { (value) in
            DispatchQueue.main.async {
                self.recipe = value.recipe
            }
        }
    }
}






