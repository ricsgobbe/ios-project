//
//  MovieListPresenter.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation

protocol MovieListPresenterProtocol: class {
    var view: MovieListViewProtocol! {get set}
    var movieUseCases: MovieUseCases! {get set}
    var databaseUseCase: MovieDatabaseUseCase! {get set}
    var navigator: MovieListNavigator! {get set}
    
    func getMovieList()
    func showMovieDetails(id: Int)
}

class MovieListPresenter: MovieListPresenterProtocol {
    var databaseUseCase: MovieDatabaseUseCase!
    
    var navigator: MovieListNavigator!
    
    var movieUseCases: MovieUseCases!
    var view: MovieListViewProtocol!
    
    
    init(view: MovieListView) {
        movieUseCases = MovieUseCases()
        databaseUseCase = MovieDatabaseUseCase()
        navigator = MovieListNavigator(view)
        self.view = view
    }
    
    func getMovieList() {
        if isConnectedToInternet() {
            movieUseCases.fetchMovieList { [weak self] (response, error) in
                guard let movies: [Movie] = response else {
                    return
                }
                self?.databaseUseCase.insertMovie(movie: movies)
                self?.view.showMovieList(movies: movies)
            }
        } else {
            databaseUseCase.fetchMovie { [weak self] (movies, error) in
                if error == nil {
                    self?.view.showMovieList(movies: movies)
                }
            }
        }
        
    }
    
    func showMovieDetails(id: Int) {
        if isConnectedToInternet() {
            movieUseCases.getMovieWith(id: id) { [weak self] (result, error) in
                if let movieDetails = result {
                    self?.databaseUseCase.insertMovieDetails(movieDetail: movieDetails)
                    self?.navigator.goToMovieDetails(movieDetails)
                }
            }
        } else {
            
        }
        
    }
    
    fileprivate func isConnectedToInternet() -> Bool {
        return NetworkManager.isConnectedToInternet()
    }
    
}
