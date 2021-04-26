//
//  NoInternetView.swift
//  CookBook
//
//  Created by SalemMacPro on 24.4.21.
//

import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack{
            Text("No internet")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            Text("Try refreshing the screen when communication is restored.")
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

struct NoInternetView_Previews: PreviewProvider {
    static var previews: some View {
        NoInternetView()
    }
}
