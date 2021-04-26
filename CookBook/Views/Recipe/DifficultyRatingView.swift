//
//  DifficultyRatingView.swift
//  CookBook
//
//  Created by SalemMacPro on 22.03.2021.
//

import SwiftUI

struct DifficultyRatingView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Difficulty:")
                .foregroundColor(Color("AdaptiveColor1"))
                .font(.system(size: 18, weight: .regular))
            HStack {
                ForEach(0..<recipe.difficulty!) {_ in
                    Image("Shape.fill")
                }
                ForEach(0..<5 - recipe.difficulty!) {_ in
                    Image("Shape")
                        
                }
            }
        }
    }
}
struct DifficultyRatingView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyRatingView(recipe: Recipe(id: nil, uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Hearty Moroccan Chicken with Couscous", image: nil, images: nil, lastUpdated: nil, description: nil, instructions: nil, difficulty: 3, similar: nil))
                            
    }
}

