//
//  Movie.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift
import Realm

class Movie: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var voteAverage: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var posterUrl: String = ""
    var genres: [String] = []
    @objc dynamic var releaseDate: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.voteAverage = json["vote_average"].intValue
        self.title = json["title"].stringValue
        self.posterUrl = json["poster_url"].stringValue
        self.genres = json["genres"].arrayValue.map({ String(describing: $0) })
        self.releaseDate = json["releaseDate"].stringValue
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    
}
