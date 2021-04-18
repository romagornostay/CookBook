//
//  DifficultyRating.swift
//  CookBook
//
//  Created by SalemMacPro on 22.03.2021.
//

import SwiftUI

struct DifficultyRating: View {
    var recipe: Recipe
    var body: some View {
        VStack(alignment: .leading) {
            Text("Difficulty:")
                .font(.system(size: 18, weight: .regular))
                .frame(width: 79, height: 21, alignment: .leading)
            
            HStack {
                ForEach(0..<recipe.difficulty) {_ in
                    Image( "Shape.fill")
                }
                ForEach(0..<5 - recipe.difficulty) {_ in
                    Image("Shape")
                        
                }
            }
        }
    }
}


