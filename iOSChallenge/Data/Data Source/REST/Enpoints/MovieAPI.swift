//
//  MovieInfo.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI {
    case movieList()
    case movieDetailWith(id: Int)
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

extension MovieAPI: TargetType {

    var baseURL: URL {
        return URL(string: "https://desafio-mobile.nyc3.digitaloceanspaces.com")!
    }
    
    var path: String {
        switch self {
        case .movieList():
            return "/movies"
        case .movieDetailWith(let id):
            return "/movies/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .movieList():
            return .get
        case .movieDetailWith(let id):
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
