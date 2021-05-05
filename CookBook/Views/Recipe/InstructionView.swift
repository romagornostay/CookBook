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
                .foregroundColor(Color("AdaptiveColor1"))
                .font(.system(size: 18, weight: .regular))
            Text(recipe.instructions!.replacingOccurrences(of: "<br>", with: "\n"))
                .foregroundColor(Color("AdaptiveColor2"))
                .font(.system(size: 13, weight: .regular))
        }
    }
}


struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView(recipe: Recipe(id: nil, uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Hearty Moroccan Chicken with Couscous", image: nil, images: nil, lastUpdated: nil, description: nil, instructions:  "1. First, thread each skewer with 1 pimento-stuffed olive.<br>2. Next, fold the bell pepper strips in half then thread one onto each skewer.<br>3. In a similar fashion, fold the salami rounds once or twice then thread one onto each skewer.<br>4. The black olives come next, followed by the artichoke hearts, the other half of the bell peppers and finally the other half of the pimento-stuffed olives.<br>5. Season with black pepper and sprinkle with chopped parsley before serving.", difficulty: nil, similar: nil))
                            
    }
}
