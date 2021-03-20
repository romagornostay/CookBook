//
//  RecipeViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 20.03.2021.
//

import Combine
import Foundation


class RecipeViewModel: ObservableObject {
    
    @Published var recipe: Recipe?
    
    var cancellable: AnyCancellable?
    
    
    init() {
        self.fetchRecipe()
    }
}


extension RecipeViewModel {
    
    private func fetchRecipe() {
        
        guard let url = URL(string: "https://test.kode-t.ru/recipes.json") else { return }
        
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Recipes.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: self.receiveCompletion(_:), receiveValue: self.receiveValue(_:))
    }
    
    private func receiveCompletion(_ completion: Subscribers.Completion<Error>) {
        
    }
    
    private func receiveValue(_ value: Recipes) {
        self.recipe = value.array.first
        print("!!!!!COUNT===== \(value.array.count) !!!!!")
    }
    
}
