//
//  MealRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct MealRow: View {
    var meal: Meal
    var body: some View {
        NavigationLink(
            destination: RecipeView(),
            label: {
                ThumbnailRow(imageURL: self.meal.imageURL, title: self.meal.name, subtitle: self.meal.description ?? self.meal.name)
            })
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        MealsView()
    }
}
