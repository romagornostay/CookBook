//
//  Instruction.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI

struct Instruction: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Instruction:")
                
                .font(.system(size: 18, weight: .regular))
                .frame(width: 92, height: 21, alignment: .leading)
            Text(recipe.instructions)
                .font(.system(size: 13, weight: .light))
                .foregroundColor(.secondary)
        }
    }
}
