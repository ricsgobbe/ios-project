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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(movie: Movie) {
        labelShadowSetup()
        downloadImageSetup(stringUrl: movie.posterUrl)
        movieTitle.text = movie.title
        releaseDate.text = movie.releaseDate.convertDateFormater()
        var appendedGenres = ""
        movie.genres.forEach({ (genre) in
            appendedGenres += " \(genre)"
        })
        genres.text = appendedGenres
    }
    
    fileprivate func downloadImageSetup(stringUrl: String) {
        let placeHolder = UIImage(named: "placeholder")
        let width = self.contentView.frame.width
        let height = MovieListTableViewCell.height
        let requiredSize = CGSize(width: width, height: height)
        moviePoster.loadImageFromUrlResized(with: stringUrl, placeholder: placeHolder!, fadeInDuration: 0.33, desiredSize: requiredSize)
    }
    
    fileprivate func labelShadowSetup() {
        movieTitle.layer.shadowColor = UIColor.black.cgColor
        movieTitle.layer.shadowRadius = 3.0
        movieTitle.layer.shadowOpacity = 1.0
        movieTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        movieTitle.layer.masksToBounds = false
    }

}
