//
//  MealsView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct MealsView: View {
    @ObservedObject var viewModel = MealsViewModel()
    var body: some View {
        List(self.viewModel.meals, rowContent: MealRow.init)
            .navigationBarTitle("Recipes")
            
    }
}

struct Meals_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
