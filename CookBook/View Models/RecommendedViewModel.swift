//
//  RecommendedViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 18.4.21.
//

import Combine
import Foundation


class RecommendedViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    
    var cancellable: AnyCancellable?
    
    init() {
        self.fetchMeals()
    }
}

extension RecommendedViewModel {
    private func fetchMeals() {
        
        guard let url = URL(string: "https://test.kode-t.ru/recipes") else { return }
        
        self.cancellable = URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: MealsDecode.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: self.receiveCompletion(_:), receiveValue: self.receiveValue(_:))
    }
    
    private func receiveCompletion(_ completion: Subscribers.Completion<Error>) {
        
    }
    
    private func receiveValue(_ value: MealsDecode) {
        self.recipes = value.array
    }
    
}
