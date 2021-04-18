//
//  MealRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct MealRow: View {
    var recipe: Recipe
    var body: some View {
        NavigationLink(destination: RecipeView(recipe: recipe)) {
            ThumbnailRow(recipe: recipe)
        }
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
