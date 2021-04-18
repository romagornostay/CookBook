//
//  MealsView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI

struct MealsView: View {
    @State var showScreenCover = false
    @State var text = ""
    @State private var isEditing = false
    @ObservedObject var viewModel = MealsViewModel()
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        if !isEditing {
                        Button("Sort by"){showScreenCover.toggle()}.padding(8)
                        }
                    }
                    HStack {
                        if !isEditing {
                            Text("Recipes").font(.system(size: 34, weight: .bold))
                                .padding(.top,16).padding(.leading,8)
                            Spacer()
                        }
                    }
                    
                    SearchBar(searchText: $text, isEditing: $isEditing)
                }
                .padding(.horizontal,8)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8171520107)))
                .foregroundColor(.black)
                .transition(.move(edge: .bottom))
                .animation(.spring())
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.meals.filter({"\($0)".contains(text.lowercased()) || text.isEmpty}), id: \.self) { recipe in
                        MealRow(recipe: recipe)
                    }
                }
                .background(Color.yellow)
                .padding(.leading, 16)
                .background(Color.blue)
                .transition(.move(edge: .bottom))
                //.navigationTitle(Text("Recipes"))
               //.navigationBarHidden(isEditing)
            }
            
            ZStack {
                if showScreenCover {
                    SortScreen(showScreenCover: $showScreenCover, recipes: $viewModel.meals)
                }
            }.zIndex(2.0)
        }.navigationBarHidden(true)
    }
}




struct Meals_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
