//
//  MealRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct RecipeElementView: View {
    
    var recipe: Recipe
    
    var body: some View {
        NavigationLink(destination: RecipeView(recipe: recipe)) {
            ThumbnailView(recipe: recipe)
        }
    }
}

struct MealRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeElementView(recipe: Recipe(id: nil, uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Pan Roasted Chicken with Lemon", image: nil, images: ["https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/goat-cheese-rolled-in-dried-cr-216282.jpg"], lastUpdated: 525224800, description: "Just in time for the holidays, this recipe is simple and easy!", instructions: nil, difficulty: nil, similar: nil))
    }
}
