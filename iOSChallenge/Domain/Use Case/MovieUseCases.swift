//
//  MovieUseCases.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation


class MovieUseCases {
    
    var controller: MovieListController!
    
    init() {
        controller = MovieListRepository()
        controller.datasource = MovieRestDataSource()
    }
    
    func fetchMovieList(completion: @escaping ([Movie], Error?) -> Void) {
        controller.getAllMovies(completion: completion)
    }
    
    func getMovieWith(id: Int) {
        
    }
    
}
