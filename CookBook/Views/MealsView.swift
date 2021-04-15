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
                        if isEditing {
                            Text("Recipes").bold().padding(5)
                        }
                        Spacer()
                        Button("Sort by"){showScreenCover.toggle()}
                    }
                    HStack {
                        if !isEditing {
                            Text("Recipes").font(.system(size: 34, weight: .bold)).padding(.top,20)
                            Spacer()
                        }
                        
                    }
                    
                    SearchBar(searchText: $text, isEditing: $isEditing)
                }.foregroundColor(.black)
                .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8171520107)))
                .animation(.spring())
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    ForEach(viewModel.meals.filter({"\($0)".contains(text.lowercased()) || text.isEmpty}), id: \.self) { meal in
                        MealRow(meal: meal)
                        
                    }
                    
                }.navigationTitle(Text("Recipes"))
                .navigationBarHidden(isEditing)
                .animation(.spring())
                
                
            }
            
            ZStack {
                if showScreenCover {
                    SortScreen(showScreenCover: $showScreenCover)
                        .transition(.move(edge: .bottom))
                        .animation(.spring())
                }
            }.zIndex(2.0)
        }.navigationBarHidden(true)
    }
}



struct SortScreen: View {
    @Binding var showScreenCover: Bool
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            
            
            VStack(spacing: 5){
                
                Button("Sort by Name"){}
                Button("Sort by Date"){}
                Button("Cancel"){showScreenCover.toggle()}
            }
            
            
            .background(Color.white)
            .cornerRadius(10)
            .padding()
            
        }
        
    }
}

struct Meals_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
