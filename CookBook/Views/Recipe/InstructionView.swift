//
//  InstructionView.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI

struct InstructionView: View {
    
    var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Instruction:")
                .foregroundColor(Color(UIColor.base1))
                .font(.system(size: 18, weight: .regular))
            Text(recipe.instructions!.replacingOccurrences(of: "<br>", with: "\n"))
                .foregroundColor(Color(UIColor.base2))
                .font(.system(size: 13, weight: .regular))
        }
    }
}
