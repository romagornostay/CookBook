//
//  ThumbnailRow.swift
//  CookBook
//
//  Created by SalemMacPro on 19.03.2021.
//

import SwiftUI
import Kingfisher

struct ThumbnailRow: View {
    
    var images: [String]
    var title: String
    var subtitle: String
    
    var body: some View {
        HStack(spacing: 20) {
            KFImage(URL(string: images.first!))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(15)
            VStack{
                Text(self.title)
                    .bold()
                Text(self.subtitle)
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
