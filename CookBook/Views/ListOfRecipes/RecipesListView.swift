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
    @State var showNoInternetView = false
    @ObservedObject private var viewModel = RecipesListViewModel()
    
    var body: some View {
        ZStack {
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
        .onAppear {
            viewModel.fetchRecipesList()
            self.showNoInternetView = viewModel.isError
            print("!!!ERROR!!!---\(viewModel.isError)")
        }
       
//        .alert(item: self.$viewModel.appError) { error in
//                Alert(
//                   title: Text("Network error"),
//                    message: Text(error.errorString).font(.subheadline),
//                   dismissButton: .default(Text("OK"))
//                 )
//        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text("Sorting"), buttons: [
                .cancel(),
                .default(Text("Sort by Name")){ viewModel.sortByName()},
                .default(Text("Sort by Date")){ viewModel.sortByLastUpdated()}
            ]

            )
        }
            if  viewModel.isError {
            
                NoInternetView(showNoInternetView: $viewModel.isError, viewModel: viewModel)
            }
        }
    }
}


struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
            RecipesListView()
        
    }
}
