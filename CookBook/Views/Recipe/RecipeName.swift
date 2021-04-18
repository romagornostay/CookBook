//
//  RecipeName.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI

struct RecipeName: View {
    var recipe: Recipe
    var body: some View {
        HStack {
            Text(recipe.name)
                .font(.system(size: 22, weight: .bold))
            //.foregroundColor(Color.black.opacity(0.75))
            Spacer()
            
            VStack{
                Spacer()
                Text("\(recipe.lastUpdated)")
                    .foregroundColor(Color(.systemRed))
                    .font(.system(size: 13, weight: .light))
                    
            }
        }.frame(width: 327, height: 70)
    }
}

