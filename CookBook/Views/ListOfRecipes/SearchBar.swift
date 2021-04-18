//
//  SearchBar.swift
//  CookBook
//
//  Created by SalemMacPro on 13.4.21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.leading, 30)
                    
            }
            .padding(.vertical,7)
            .foregroundColor(.black)
            .background(Color(.systemGray6).cornerRadius(10))
            
            .onTapGesture {isEditing = true}
            .overlay( HStack {
                Image(systemName: "magnifyingglass")
                Spacer()
                if isEditing, searchText.count > 0 {
                    Button(action: {searchText = ""}) {Image(systemName: "multiply.circle.fill")}
                }
                
            }
            .foregroundColor(.gray)
            
            .padding(8)
            
            
            )
            .transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder
                        .resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: { Text("Cancel")
                    .padding(.trailing)
                    .padding(.leading, 0)
                })
                
            }
        }
        .transition(.move(edge: .trailing))
        .animation(.spring())
    }
}


