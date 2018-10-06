//
//  MovieInfoTableViewCell.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable

class MovieInfoTableViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    
}

extension MovieInfoTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension MovieInfoTableViewCell {
    
    func render(movieDetail: MovieDetail) {
       movieTitle.text = movieDetail.originalTitle
       overview.text = movieDetail.overview
       var appendedGenres = ""
        movieDetail.genres.forEach { (genre) in
            appendedGenres = genre + ""
        }
        genre.text = appendedGenres
    }
    
}
