//
//  MealRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct MealRow: View {
    var meal: Recipe
    var body: some View {
        NavigationLink(destination: RecipeView(meal: self.meal)) {
            ThumbnailRow(images: meal.images, title: meal.name, subtitle: meal.description ?? meal.name)
        }
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
