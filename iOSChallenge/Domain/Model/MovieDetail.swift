//
//  MovieDetail.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MovieDetail {
    
    let adult: Bool
    let backdrop: String
    let genres: [String]
    let originalTitle: String
    let overview: String
    let posterUrl: String
    
    init(json: JSON) {
        adult = json["adult"].boolValue
        backdrop = json["backdrop"].stringValue
        genres = json["genres"].arrayValue.map({ String(describing: $0) })
        originalTitle = json["original_title"].stringValue
        overview = json["overview"].stringValue
        posterUrl = json["poster_url"].stringValue
    }
}
