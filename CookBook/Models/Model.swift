//
//  Model.swift
//  CookBook
//
//  Created by SalemMacPro on 18.03.2021.
//

import Foundation

struct Model: Decodable, Identifiable {
    // MARK: Properties
    
    var id: String
    var name: String
    var images: [String]
    var lastUpdated: Int
    var description: String
    var instructions: String
    var difficulty: Int
    
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
