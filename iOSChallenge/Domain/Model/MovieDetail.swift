//
//  MovieDetail.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import SwiftyJSON
import Realm
import RealmSwift

class MovieDetail: Object {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdrop: String = ""
    var genres: [String] = []
    @objc dynamic var originalTitle: String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var posterUrl: String = ""
    @objc dynamic var voteAverage: Float = 0.0
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.adult = json["adult"].boolValue
        self.backdrop = json["backdrop"].stringValue
        self.genres = json["genres"].arrayValue.map({ String(describing: $0) })
        self.originalTitle = json["original_title"].stringValue
        self.overview = json["overview"].stringValue
        self.posterUrl = json["poster_url"].stringValue
        self.voteAverage = json["vote_average"].floatValue
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
    
}
