//
//  PosterImageTableViewCell.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable

class PosterImageTableViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backdropImage: UIImageView!
    
    static let height: CGFloat = 193.0
    
}


extension PosterImageTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension PosterImageTableViewCell {
    func render(poster: String, and backdrop: String) {
        let placeholder = UIImage(named: "placeholder")
        posterImage.loadImageFromURL(stringUrl: backdrop, placeholder: placeholder!, fadeInDuration: 0.2)
        backdropImage.loadImageFromURL(stringUrl: backdrop, placeholder: placeholder!, fadeInDuration: 0.2)
    }
    
}
