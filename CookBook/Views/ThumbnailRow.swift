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
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .cornerRadius(15)
            VStack{
                Text(self.title)
                    .bold()
                Text(self.title)
                    .italic()
            }
            
        }
    }
}

struct ThumbnailRow_Previews: PreviewProvider {
    static var previews: some View {
        ThumbnailRow(imageURL: nil, title: "Title", subtitle: "SubTitle")
    }
}
