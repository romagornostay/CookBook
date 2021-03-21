//
//  JSONDecode.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import Foundation

protocol JSONDecode: Decodable {
    associatedtype Items
    var array: Items { get }
}
