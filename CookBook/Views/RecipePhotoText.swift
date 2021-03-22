//
//  RecipePhotoText.swift
//  CookBook
//
//  Created by SalemMacPro on 22.03.2021.
//

import SwiftUI

struct RecipePhotoText: View {
    var recipe: Recipe
    
    
    var body: some View {
        HStack {
            Text(recipe.name)
                
                .padding(2)
                .background(Color.black.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 5))

            Spacer()
//            Text("\(Image(systemName:"flag"))\(recipe.difficulty)\(Image(systemName:"flag"))")
                DifficultyRating(recipe: recipe)
                .background(Color.black.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .foregroundColor(Color.white)
        .font(.footnote)
        .padding()

        
    }
}


struct RecipePhotoText_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

