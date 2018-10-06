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
    var navigator: MovieListNavigator! {get set}
    
    func getMovieList()
    func showMovieDetails()
}

class MovieListPresenter: MovieListPresenterProtocol {
    var navigator: MovieListNavigator!
    
    var movieUseCases: MovieUseCases!
    var view: MovieListViewProtocol!
    
    
    init(view: MovieListView) {
        movieUseCases = MovieUseCases()
        navigator = MovieListNavigator(view)
        self.view = view
    }
    
    func getMovieList() {
        movieUseCases.fetchMovieList { [weak self] (response, error) in
            guard let movies: [Movie] = response else {
                return
            }
            self?.view.showMovieList(movies: movies)
        }
    }
    
    func showMovieDetails() {
        navigator.goToMovieDetails()
    }
    
    
}
