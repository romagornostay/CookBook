//
//  Meal.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Foundation

struct Meal: Decodable, Identifiable {
    
    // MARK: Properties
    var id: String
    var name: String
    var images: [String]
    var description: String?
    
    var imageURL: URL? {
        return URL(string: self.images[0])
    }
    
    // MARK: CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case images
        case description
    }
    
}
