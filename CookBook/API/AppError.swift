//
//  AppError.swift
//  CookBook
//
//  Created by SalemMacPro on 30.4.21.
//

import Foundation

struct AppError: Identifiable {
    let id = UUID().uuidString
    let errorString: String
}
