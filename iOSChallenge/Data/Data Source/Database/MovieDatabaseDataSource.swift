//
//  MovieDatabaseDataSource.swift
//  iOSChallenge
//
//  Created by Mac on 07/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation
import RealmSwift


class MovieDatabaseDataSource: MovieDatabaseDataSourceProtocol {
    
    func insertMovie(movie: [Movie]) {
        let realm = try! Realm()
        movie.forEach { (movieData) in
            if !updateMovie(movie: movieData) {
                try! realm.write {
                    realm.add(movieData)
                }
            }
        }
    }
    
    func insertMovieDetail(movieDetail: MovieDetail) {
        let realm = try! Realm()
        if !updateMovieDetails(movie: movieDetail) {
            try! realm.write {
                realm.add(movieDetail)
            }
        }
    }
    
    
    func update(id: String) {
        
    }
    
    fileprivate func updateMovie(movie: Movie) -> Bool {
        let realm = try! Realm()
        if let movieToUpdate: Results<Movie> = realm.objects(Movie.self).filter("id == %@", movie.id) {
            var movieFound = movieToUpdate.first
            try! realm.write {
               movieFound = movie
            }
            return true
        } else {
            return false
        }
        
    }
    
    fileprivate func updateMovieDetails(movie: MovieDetail) -> Bool {
        let realm = try! Realm()
        if let movieToUpdate: Results<MovieDetail> = realm.objects(MovieDetail.self).filter("id == %@", movie.id) {
            var movieFound = movieToUpdate.first
            try! realm.write {
                movieFound = movie
            }
            return true
        } else {
            return false
        }
    }
    
    func fetchMovieList(completion: @escaping ([Movie], Error?) -> Void) {
        let realm = try! Realm()
        let movies =  realm.objects(Movie.self)
        var foundMovies: [Movie] = []
        movies.forEach { (movie) in
            foundMovies.append(movie)
        }
        completion(foundMovies, nil)
    }
    
    func getMovieDetails(id: Int, completion: @escaping (MovieDetail?, Error?) -> Void) {
        
    }
    
    
}
