//
//  APIManager.swift
//  CookBook
//
//  Created by SalemMacPro on 24.4.21.
//

import Foundation
import Combine

class APIManager {
    
    private var subscribers = Set<AnyCancellable>()
    
    func fetchItems<T: Decodable> (url: URL, complection: @escaping (Result<T,Error>) -> Void ) {
            URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (resultComplection) in
                switch resultComplection {
                case .failure(let error):
                    complection(.failure(error))
                case .finished: break
                }
            }, receiveValue: { (resultValue) in
                complection(.success(resultValue))
            }).store(in: &subscribers)
    }
}
