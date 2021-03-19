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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
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
