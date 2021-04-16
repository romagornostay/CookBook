//
//  Recipe.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Foundation

struct Recipe: Decodable, Identifiable, Hashable {
    
    // MARK: Properties
    var id: String
    var name: String
    var images: [String]
    var lastUpdated: Int
    var description: String?
    var instructions: String
    var difficulty: Int
    
    var imageURL: URL? {
        return URL(string: self.images[0])
    }

    
    // MARK: CodingKeys
    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case images
        case lastUpdated
        case description
        case instructions
        case difficulty
    }
}
