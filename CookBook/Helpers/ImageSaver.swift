//
//  ImageSaver.swift
//  CookBook
//
//  Created by SalemMacPro on 15.4.21.
//

import Foundation
import SwiftUI

class ImageSaver: NSObject {
    
    @State var isLoading = false
    
    @objc func imageSaveListener(_ image: UIImage,didFinishSavingWithError error: Error?, contexInfo: UnsafeRawPointer ){
        if let error = error {
            print("error saving image: \(error.localizedDescription)")
        } else {
            isLoading = false
            print("image saved ")
        }
        
    }
    func saveImage(_ image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(imageSaveListener(_:didFinishSavingWithError:contexInfo:)), nil)
    }
    
}
