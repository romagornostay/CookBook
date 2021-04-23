//
//  RecipeNameView.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI

struct RecipeNameView: View {
    var recipe: Recipe
    var body: some View {
        HStack(alignment: .bottom) {
            Text(recipe.name)
                .foregroundColor(Color(UIColor.base1))
                .font(.system(size: 28, weight: .bold))
            Spacer()
            
            
            Text(DateFormatter.ddMMyyyy.string(from: Date(timeIntervalSince1970: TimeInterval(recipe.lastUpdated!))))
                .foregroundColor(Color(UIColor.base1))
                .font(.system(size: 13, weight: .regular))
            
            
        }
    }
}

