//
//  KodeAPI.swift
//  CookBook
//
//  Created by SalemMacPro on 21.4.21.
//

import Foundation

enum KodeAPI {
    
    enum Endpoint {
        case recipes, recipe(id: String)
        
        var path: String {
          switch self {
          case .recipes: return "/recipes"
          case .recipe(let uuid): return "/recipes/" + uuid
          }
        }
    }
    
    static func url(_ endpoint: Endpoint) -> URL? {
        var components = URLComponents(string: "https://test.kode-t.ru")
        components?.path = endpoint.path
        return components?.url
    }
}
