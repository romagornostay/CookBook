//
//  ContentView.swift
//  CookBook
//
//  Created by SalemMacPro on 18.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: MealsView.init)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
