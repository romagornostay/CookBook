//
//  SortScreen.swift
//  CookBook
//
//  Created by SalemMacPro on 17.4.21.
//

import SwiftUI

struct SortScreen: View {

    @Binding var showScreenCover: Bool
    @Binding var recipes: [Recipe]
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                VStack {
                    Button(action:{
                        recipes.sort {$0.name<$1.name}
                        showScreenCover.toggle()
                    }){
                        Text("Sort by Name")
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemBackground).cornerRadius(10))
                    }
                    Divider()
                    
                    Button(action:{
                        recipes.sort {$0.lastUpdated<$1.lastUpdated}
                        showScreenCover.toggle()
                    }){
                        Text("Sort by Date")
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemBackground).cornerRadius(10))
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemBackground).cornerRadius(10))
                
                
                //Button("Cancel"){showScreenCover.toggle()}
                
                Button(action:{showScreenCover.toggle()}) {
                    Text("Cancel")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemBackground).cornerRadius(10))
                }
                
                
            }.padding(8)
            
            
        }
        //.transition(.move(edge: .top))
        //.animation(.spring())
        
    }
}
