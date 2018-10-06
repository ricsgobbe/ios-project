//
//  MovieListRepository.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation

class MovieListRepository: MovieListController {
    var datasource: MovieDataSource!
    
    func getAllMovies(completion: @escaping ([Movie], Error?) -> Void) {
        datasource.fetchMovieList(completion: completion)
    }
    
    func getMovieDetails(id: Int, completion: @escaping(MovieDetail?, Error?) -> Void) {
        datasource.getMovieDetails(id: id, completion: completion)
    }
    
    
}
