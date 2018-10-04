//
//  Movie.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Movie {
    let id: Int
    let voteAverage: Int
    let title: String
    let posterUrl: String
    let genres: [String]
    let releaseDate: String
    
    init(json: JSON) {
        id = json["id"].intValue
        voteAverage = json["vote_average"].intValue
        title = json["title"].stringValue
        posterUrl = json["poster_url"].stringValue
        genres = json["genres"].arrayValue.map({ String(describing: $0) })
        releaseDate = json["releaseDate"].stringValue
    }
}
