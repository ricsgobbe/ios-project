//
//  Nuke+UIImage.swift
//  CodeChallenge
//
//  Created by Mac on 02/09/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    
    func loadImageFromURL(stringUrl: String, placeholder: UIImage, fadeInDuration: TimeInterval) {
        let options = ImageLoadingOptions(
            placeholder: placeholder,
            transition: .fadeIn(duration: 0.33))
        let url = URL(string: stringUrl)!
        
        Nuke.loadImage(with: url, options: options, into: self)
    
    }
    
    
    func loadImageFromUrlResized(with stringUrl: String, placeholder: UIImage, fadeInDuration: TimeInterval, desiredSize: CGSize) {
        let options = ImageLoadingOptions(
            placeholder: placeholder,
            transition: .fadeIn(duration: fadeInDuration))
        let url = URL(string: stringUrl)!
        let request = ImageRequest(url: url, targetSize: desiredSize, contentMode: .aspectFit)
        Nuke.loadImage(with: request, options: options, into: self, progress: nil, completion: nil)
        
    }
    
}
