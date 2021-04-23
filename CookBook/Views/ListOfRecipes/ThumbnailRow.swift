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
                    .foregroundColor(Color(UIColor.base1))
                Text(recipe.description?.count ?? 0 > 1 ? recipe.description! : recipe.name)
                    .foregroundColor(Color(UIColor.base2))
                    .font(.system(size: 13, weight: .regular))
                Text(DateFormatter.ddMMyyyy.string(from: Date(timeIntervalSince1970: TimeInterval(recipe.lastUpdated!))))
                    .foregroundColor(Color(UIColor.base1))
                    .font(.system(size: 13, weight: .regular))
            }
            .lineLimit(2)
            
            Spacer()
            
            if let stringURL = recipe.images?.first {
                let url = URL(string: stringURL)
                KFImage(url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 204, height: 112)
                    .cornerRadius(10)
                    .offset(x: 45)
                //.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 45))
            }
        }
    }
}

struct ThumbnailRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
