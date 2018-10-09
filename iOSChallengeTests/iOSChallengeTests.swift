//
//  iOSChallengeTests.swift
//  iOSChallengeTests
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//


@testable import iOSChallenge

import Quick
import Nimble

class iOSChallengeTests: QuickSpec {
    
    class FakeDatabaseDataSource: MovieDatabaseDataSourceProtocol {
        
        func insertMovie(movie: [Movie]) {
            
        }
        
        func insertMovieDetail(movieDetail: MovieDetail) {
            
        }
        
        func update(id: String) {
            
        }
        
        func fetchMovieList(completion: @escaping ([Movie], Error?) -> Void) {
            let movies = generateMovieList()
            completion(movies, nil)
        }
        
        func getMovieDetails(id: Int, completion: @escaping (MovieDetail?, Error?) -> Void) {
            completion(movieDetailMocked(), nil)
        }
        
        
        fileprivate func movieDetailMocked() -> MovieDetail {
            let detail = MovieDetail()
            detail.adult = false
            detail.backdrop = "teste@teste.com"
            detail.genres = ["Teste"]
            detail.id = 1
            detail.originalTitle = "Teste"
            detail.overview = "Teste"
            detail.voteAverage = 10.0
            return detail
        }
        
        fileprivate func generateMovieList() -> [Movie] {
            let movie = Movie()
            var movies: [Movie] = []
            movie.id = 1
            movie.posterUrl = "teste@teste.com"
            movie.releaseDate = "1970-01-01"
            movie.title = "Teste"
            movie.voteAverage = 10
            for _ in 1...5 {
                movies.append(movie)
            }
            return movies
        }
        
    }
    
    override func spec() {
        describe("validating movie database use case ") {
            let databaseUseCase = MovieDatabaseUseCase(databaseProtocol: FakeDatabaseDataSource())
            
            context("it should return a list of movies") {
                databaseUseCase.fetchMovie(completion: { (movies, error) in
                    expect(movies).notTo(beNil())
                    expect(movies.count).to(equal(5))
                })
            }
            
            
            context("it should return a movie detail") {
                databaseUseCase.getMovieDetailInDB(id: 1, completion: { (detail, error) in
                    expect(detail).notTo(beNil())
                    expect(detail?.backdrop).to(equal("teste@teste.com"))
                })
            }
        }
    }
 
    
}
