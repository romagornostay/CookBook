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
        HStack {
            
            VStack(alignment: .leading, spacing: 6){
                Text(title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(Color.black.opacity(0.75))
                Text(subtitle)
                    .foregroundColor(.secondary)
                    .font(.system(size: 13, weight: .medium))
            }.lineLimit(2)
            
            //Spacer()
                
            KFImage(imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 204, height: 112)
                .cornerRadius(10)
                .offset(x: 45)
                .padding(.vertical)
            
            
                
            
        }
    }
}

struct ThumbnailRow_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
