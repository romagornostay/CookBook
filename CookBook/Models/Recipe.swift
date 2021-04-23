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
    var image: String?
    var images: [String]?
    var lastUpdated: Int?
    var description: String?
    var instructions: String?
    var difficulty: Int?
    var similar: [Recipe]?
    
}
