//
//  DifficultyRating.swift
//  CookBook
//
//  Created by SalemMacPro on 22.03.2021.
//

import SwiftUI

struct DifficultyRating: View {
    var recipe: Recipe
    var body: some View {
        HStack {
            ForEach(0..<recipe.difficulty) {_ in
                Image(systemName: "leaf.fill").foregroundColor(.green)
            }
        }
    }
}

struct DifficultyRating_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
