//
//  Recipes.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Foundation

struct Recipes: JSONDecode {
    
    // MARK: Coding Keys
    private enum CodingKeys: String, CodingKey {
        case array = "recipes"
    }
    
    // MARK: Properties
    var array: [Recipe]
}
