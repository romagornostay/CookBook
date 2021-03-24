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
                .padding(5)
            
            Spacer()
            
            VStack(alignment:.trailing){
                Text("Difficulty").italic()
                DifficultyRating(recipe: recipe)
                
            }.padding(5)
        }
        .foregroundColor(Color.white)
        .background(Color(.black).opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .font(.footnote)
        .padding(.bottom, 40)
        
        
    }
}


struct RecipePhotoText_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

