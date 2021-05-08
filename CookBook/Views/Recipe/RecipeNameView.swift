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
                .foregroundColor(Color("AdaptiveColor1"))
                .font(.system(size: 28, weight: .bold))
            
            Spacer()
            
            Text(DateFormatter.ddMMyyyy.string(from: Date(timeIntervalSince1970: TimeInterval(recipe.lastUpdated!))))
                .foregroundColor(Color("AdaptiveColor1"))
                .font(.system(size: 13, weight: .regular))
                .padding(.bottom, 5)
        }
    }
}

struct RecipeNameView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeNameView(recipe: Recipe(id: nil , uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Pan Roasted Chicken with Lemon", image: nil, images: nil, lastUpdated: 525224800, description: "Just in time for the holidays, this recipe is simple and easy!", instructions: nil, difficulty: nil, similar: nil))
    }
}
