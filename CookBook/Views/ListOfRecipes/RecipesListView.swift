//
//  RecipesListView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct RecipesListView: View {
    
    @State private var showActionSheet = false
    @State private var text = ""
    @State private var isEditing = false
    @ObservedObject private var viewModel = RecipesListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                SearchBarView(searchText: $text, isEditing: $isEditing).padding(.horizontal,8)
                ForEach(viewModel.filter(viewModel.recipes, text: text), id: \.self) { recipe in
                    RecipeElementView(recipe: recipe)
                }.padding(.leading)
            }
            .navigationBarTitle(Text("Recipes"))
            .navigationBarHidden(isEditing)
            .toolbar { Button("Sort by"){showActionSheet = true} }
        }
        .animation(.default)
        .transition(.move(edge: .top))
        .accentColor(Color("AdaptiveColor1"))
        .onAppear { viewModel.fetchRecipesList()}
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Sorting"), buttons: [
                .cancel(),
                .default(Text("Sort by Name")){ viewModel.sortByName()},
                .default(Text("Sort by Date")){ viewModel.sortByLastUpdated()}
            ]
            
            )
        }
    }
}


struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
            RecipesListView()
        
    }
}
