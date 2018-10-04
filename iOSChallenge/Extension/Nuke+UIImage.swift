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
    
}
