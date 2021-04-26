//
//  ThumbnailView.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI
import Kingfisher

struct ThumbnailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 4){
                    Text(recipe.name)
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(Color("AdaptiveColor1"))
                    Text(recipe.description?.count ?? 0 > 1 ? recipe.description! : recipe.name)
                        .foregroundColor(Color("AdaptiveColor2"))
                        .font(.system(size: 13, weight: .regular))
                    Text(DateFormatter.ddMMyyyy.string(from: Date(timeIntervalSince1970: TimeInterval(recipe.lastUpdated!))))
                        .foregroundColor(Color("AdaptiveColor1"))
                        .font(.system(size: 13, weight: .regular))
                }
                .frame(width: 180.0, height: 112)
                .lineLimit(2)
                
                Spacer()
            }
            
            HStack {

                Spacer()

                if let stringURL = recipe.images?.first {
                    let url = URL(string: stringURL)
                    KFImage(url)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 204, height: 112.0)
                        .cornerRadius(10)
                        .offset(x: 50)
                }
            }
        }
    }
}

struct ThumbnailView_Previews: PreviewProvider {
    static var previews: some View {
        
        ThumbnailView(recipe: Recipe(id: nil, uuid: "fc988768-c1e9-11e6-a4a6-cec0c932ce01", name: "Pan Roasted Chicken with Lemon", image: nil, images: ["https://bigoven-res.cloudinary.com/image/upload/t_recipe-256/goat-cheese-rolled-in-dried-cr-216282.jpg"], lastUpdated: 525224800, description: "Just in time for the holidays, this recipe is simple and easy!", instructions: nil, difficulty: nil, similar: nil))
    }
}
