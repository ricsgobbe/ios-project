//
//  MovieListDatabaseRepository.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation


class MovieListDatabaseRepository: MovieListDatabaseController {
    var datasource: MovieDatabaseDataSourceProtocol!
    
    
    
    func getAllMovies(completion: @escaping ([Movie], Error?) -> Void) {
        datasource.fetchMovieList(completion: completion)
    }
    
    
    func insertMovie(movie: [Movie]) {
        datasource.insertMovie(movie: movie)
    }
    
    func insertMovieDetail(movieDetail: MovieDetail) {
        datasource.insertMovieDetail(movieDetail: movieDetail)
    }
    
    func update(id: String) {
        datasource.update(id: id)
    }
    
    func fetchMovieList(completion: @escaping ([Movie], Error?) -> Void) {
        datasource.fetchMovieList(completion: completion)
    }
    
    func getMovieDetails(id: Int, completion: @escaping (MovieDetail?, Error?) -> Void) {
        datasource.getMovieDetails(id: id, completion: completion)
    }
    
    
}
