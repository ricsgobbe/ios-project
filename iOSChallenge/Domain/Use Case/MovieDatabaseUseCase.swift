//
//  MovieOfflineUseCase.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation

class MovieDatabaseUseCase {
    var controller: MovieListDatabaseController!
    
    init() {
        controller = MovieListDatabaseRepository()
        controller.datasource = MovieDatabaseDataSource()
    }
    
    func insertMovie(movie: [Movie]) {
        controller.insertMovie(movie: movie)
    }
    func fetchMovie(completion: @escaping ([Movie], Error?) -> Void) {
        controller.getAllMovies(completion: completion)
    }
    
    func insertMovieDetails(movieDetail: MovieDetail) {
        controller.insertMovieDetail(movieDetail: movieDetail)
    }
    
    func getMovieDetailInDB(id: Int, completion: @escaping (MovieDetail?, Error?) -> Void) {
        controller.getMovieDetails(id: id, completion: completion)
    }
    
}
