//
//  MovieListTableViewCell.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable

class MovieListTableViewCell: UITableViewCell, NibLoadable, Reusable {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var opacityView: UIView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var genres: UILabel!
    
    static var height: CGFloat = 276
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(movie: Movie) {
        let placeholder = UIImage(named: "placeholder")
        moviePoster.loadImageFromURL(stringUrl: movie.posterUrl, placeholder: placeholder!, fadeInDuration: 0.2)
        movieTitle.text = movie.title
        releaseDate.text = movie.releaseDate.convertDateFormater()
        var appendedGenres = ""
        movie.genres.forEach({ (genre) in
            appendedGenres += " \(genre)"
        })
        genres.text = appendedGenres
    }
    
    
}
