//
//  ThumbnailRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI
import Kingfisher

struct ThumbnailRow: View {
    
    var imageURL: URL?
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack(spacing: 20) {
            KFImage(self.imageURL)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(15)

            VStack(alignment: .leading, spacing: 6){
                Text(self.title)
                .fontWeight(Font.Weight.black)
                Text(self.subtitle)
                    .foregroundColor(.secondary)
                    .fontWeight(Font.Weight.light)
                    .italic()
                
            }.lineLimit(2)
        }
    }
}

struct ThumbnailRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
