//
//  MovieDataSource.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation

protocol MovieDataSource {
    func fetchMovieList(completion: @escaping ([Movie], Error?) -> Void)
    func getMovieDetails(id: Int, completion: @escaping (MovieDetail?, Error?) -> Void)
}

protocol MovieDatabaseDataSourceProtocol: MovieDataSource {
    
    func insertMovie(movie: [Movie])
    func insertMovieDetail(movieDetail: MovieDetail)
    func update(id: String)
    
}

