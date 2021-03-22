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
            
            Spacer()
            
            VStack(alignment:.trailing){
                Text("difficulty")
                DifficultyRating(recipe: recipe)
            }
            .padding(2)
        }
        .foregroundColor(Color.white)
        .background(Color.black.opacity(0.4)).clipShape(RoundedRectangle(cornerRadius: 6))
        .font(.footnote)
        .padding(.bottom, 40)
        
        
    }
}


struct RecipePhotoText_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

