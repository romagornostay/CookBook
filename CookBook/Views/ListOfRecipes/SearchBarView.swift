//
//  SearchBarView.swift
//  CookBook
//
//  Created by SalemMacPro on 13.4.21.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isEditing: Bool
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6).cornerRadius(10))
                //.padding(.horizontal, 10)
                .onTapGesture {isEditing = true}
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing, searchText.count > 0 {
                            Button(action: {searchText = ""}) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    })
            
            if isEditing {
                Button(action: {
                    isEditing = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder
                            .resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), isEditing: .constant(true))
    }
}
