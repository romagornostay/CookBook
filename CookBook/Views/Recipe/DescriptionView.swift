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
    }
}


struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(recipe: Recipe(id: nil , uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Pan Roasted Chicken with Lemon", image: nil, images: nil, lastUpdated: nil, description: "Just in time for the holidays, this recipe is simple and easy!", instructions: nil, difficulty: nil, similar: nil))
    }
}
