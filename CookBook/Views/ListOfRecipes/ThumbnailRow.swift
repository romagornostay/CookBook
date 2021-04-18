//
//  ThumbnailRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI
import Kingfisher

struct ThumbnailRow: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack {
            
            VStack(alignment: .leading, spacing: 10){
                Text(recipe.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color(.black).opacity(0.75))
                Text(recipe.description?.count ?? 0 > 1 ? recipe.description! : recipe.name)
                    .foregroundColor(.secondary)
                    .font(.system(size: 13, weight: .medium))
                Text("\(recipe.lastUpdated)")
                    .foregroundColor(.black)
                    .font(.system(size: 13, weight: .light))
            }
            .lineLimit(2)
            
            //Spacer()
                
            KFImage(recipe.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 204, height: 112)
                .cornerRadius(10)
                .offset(x: 45)
                //.background(Color.blue)
            
            
                
            
        }
    }
}

struct ThumbnailRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
