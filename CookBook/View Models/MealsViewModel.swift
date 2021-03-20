//
//  MealsViewModel.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Combine
import Foundation


class MealsViewModel: ObservableObject {
    // MARK: Properties
    
    @Published var meals: [Meal] = []
    
    var cancellable: AnyCancellable?
    
    // MARK: Initializers
    
    init() {
        
        self.fetchMeals()
    }
}

// MARK: - Fetching

extension MealsViewModel {
    private func fetchMeals() {
        
        guard let url = URL(string: "https://test.kode-t.ru/recipes.json") else { return }
        
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
        self.meals = value.array
        print("!!!!!COUNT Meals===== \(self.meals.count) !!!!!")
//        print(meals)
    }
}
