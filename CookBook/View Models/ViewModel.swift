//
//  ViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Combine
import Foundation


class ViewModel: ObservableObject {
    // MARK: Properties
    
    @Published var viewModel = [Model]()
    
    var cancellable: AnyCancellable?
    
    // MARK: Initializers
    
    init() {
        
        self.fetchMeals()
    }
}

// MARK: - Fetching

extension ViewModel {
    private func fetchMeals() {
        
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
        self.viewModel = value.recipes
        print(viewModel)
        
    }
    
}
