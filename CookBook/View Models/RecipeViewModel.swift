//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 20.03.2021.
//

import Combine
import Foundation


final class RecipeViewModel: ObservableObject {
    
    @Published var recipe: Recipe?
    var cancellable: AnyCancellable?
    var meal: Recipe
    
    init(meal: Recipe) {
        self.meal = meal
        self.fetchRecipe()
    }
    
    func fetchRecipe() {
        
        guard let url = KodeAPI.url(.recipe(id: meal.uuid)) else { return }
        
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RecipeDetails.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print("Completion/Failure: \($0)")}, receiveValue: self.receiveValue(_:))
    }
    
    private func receiveValue(_ value: RecipeDetails) {
        self.recipe = value.recipe
       
        
    }
}






