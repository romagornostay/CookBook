//
//  BackButton.swift
//  CookBook
//
//  Created by SalemMacPro on 16.4.21.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button { presentationMode.wrappedValue.dismiss() }
            label: {
                HStack {
                    Image(systemName: "chevron.left").font(.largeTitle)
                    Text("Back")
                    Spacer()
                }
                .foregroundColor(.black)
                .padding(5)
            }
    }
}


