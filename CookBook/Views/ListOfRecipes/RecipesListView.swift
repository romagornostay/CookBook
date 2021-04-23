//
//  RecipesListView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct RecipesListView: View {
    
    @State var showActionSheet = false
    @State var text = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = RecipesListViewModel()
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical, showsIndicators: false) {
                SearchBarView(searchText: $text, isEditing: $isEditing).padding(.horizontal,8)
                ForEach(viewModel.filter(viewModel.recipes, text: text), id: \.self) { recipe in
                    RecipeRow(recipe: recipe)
                }.padding(.leading)
            }
            
            .navigationTitle("Recipes")
            .navigationBarHidden(isEditing)
            .toolbar {
                Button("Sort by"){showActionSheet = true}
                    .padding(8)
            }
            
        }
        .accentColor(.black)
        .onAppear { viewModel.fetchMeals()}
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Sorting"), buttons: [
                .cancel(),
                .default(Text("Sort by Name"), action: {
                    viewModel.recipes.sort {$0.name<$1.name}
                }),
                .default(Text("Sort by Date"), action: {
                    viewModel.recipes.sort {$0.lastUpdated!<$1.lastUpdated!}
                })
                
            ]
            
            )
            
        }
    }
}




struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
