//
//  MovieDataSource.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import Moya


class MovieRestDataSource: MovieDataSource {
    func fetchMovieList(completion: @escaping ([Movie], Error?) -> Void) {
        let service = Service<MovieAPI>(plugins: [MoviePlugins()])
        service.request(.movieList()) { (result) in
            switch result {
            case .success(let movieList):
                let convertedMovies = movieList.arrayValue.map({ Movie(json: $0) })
                completion(convertedMovies, nil)
                return
                
            case .failure(let error):
                completion([], error)
                return
            }
        }
    }
}
