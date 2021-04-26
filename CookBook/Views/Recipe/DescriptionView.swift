//
//  DescriptionView.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI

struct DescriptionView: View {
    
    var recipe: Recipe
    
    var body: some View {
        Text(recipe.description?.count ?? 0 > 1 ? recipe.description! : recipe.name)
            .foregroundColor(Color("AdaptiveColor2"))
            .font(.system(size: 13, weight: .regular))
            //.frame(width: .infinity, alignment: .leading)
    }
}

