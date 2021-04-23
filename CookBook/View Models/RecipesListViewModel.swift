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
    
    var cancellable: AnyCancellable?
    
//    init() {
//        self.fetchMeals()
//    }
    
    func filter(_ array: [Recipe], text: String) -> [Recipe]{
        var recipesList = array
        recipesList = recipes.filter({text.isEmpty ? true : "\($0)".contains(text.lowercased())})
        return recipesList
    }
    
    func fetchMeals() {
        
        guard let url = KodeAPI.url(.recipes) else { return }
        
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: RecipesList.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { print("Completion/Failure: \($0)")}, receiveValue: self.receiveValue(_:))
    }
    
    
    private func receiveValue(_ value: RecipesList) {
        self.recipes = value.recipes
        
    }
}


    
//    func updateArray() {
//        let sortedArray = meals.sorted(by: {$0.name < $1.name})
//        self.meals = sortedArray
//    }

