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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Meals_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
