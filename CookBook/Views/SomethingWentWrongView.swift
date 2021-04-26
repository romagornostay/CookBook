//
//  SomethingWentWrongView.swift
//  CookBook
//
//  Created by SalemMacPro on 24.4.21.
//

import SwiftUI

struct SomethingWentWrongView: View {
    var body: some View {
        VStack{
            Text("Something went wrong")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            Text("The problem is on our side, we are already looking into it. Please try refreshing the screen later.")
                .multilineTextAlignment(.center)
                .frame(width: 250)
                .font(.system(size: 16, weight: .regular))
                .padding()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                ZStack {
                    RoundedRectangle(cornerRadius: 22)
                        .stroke()
                        .frame(width: 311, height: 44)
                    Text("Refresh")
                }
            }
        }
    }
}

struct SomethingWentWrongView_Previews: PreviewProvider {
    static var previews: some View {
        SomethingWentWrongView()
    }
}
