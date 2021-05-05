//
//  NoInternetView.swift
//  CookBook
//
//  Created by SalemMacPro on 24.4.21.
//

import SwiftUI

struct NoInternetView: View {
    
    @Binding var showNoInternetView: Bool
    var viewModel: RecipesListViewModel
    
//    init(errorView: Bool,vm: RecipesListViewModel) {
//        self.showNoInternetView = errorView
//        self.viewModel = vm
//    }
    //@State var noData = true

    var body: some View {
        ZStack{
            VStack{
                Text("No internet")
                    .font(.system(size: 24, weight: .bold))
                    .padding()
                
                Text("Try refreshing the screen when communication is restored.")
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                    .font(.system(size: 16, weight: .regular))
                    .padding()
                
                Button(action: { showNoInternetView.toggle()
                    viewModel.appError = nil
                    //viewModel.fetchRecipesList()
                    
                }) {
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
}

struct NoInternetView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
       // NoInternetView(showNoInternetView: .constant(true))
    }
}
