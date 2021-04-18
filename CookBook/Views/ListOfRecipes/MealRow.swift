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
            ThumbnailRow(imageURL: recipe.imageURL, title: recipe.name, subtitle: recipe.description?.count ?? 0 > 1 ? recipe.description! : recipe.name)
        }
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
