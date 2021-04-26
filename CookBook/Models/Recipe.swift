//
//  Recipe.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Foundation

struct Recipe: Decodable, Hashable {
    
    lazy var id = UUID(uuidString: uuid)
    let uuid: String
    let name: String
    let image: String?
    let images: [String]?
    let lastUpdated: Int?
    let description: String?
    let instructions: String?
    let difficulty: Int?
    let similar: [Recipe]?
    
}
