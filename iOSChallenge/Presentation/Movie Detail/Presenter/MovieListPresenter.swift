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
    
    func getMovieList()
    
}

class MovieListPresenter: MovieListPresenterProtocol {
    var movieUseCases: MovieUseCases!
    var view: MovieListViewProtocol!
    
    
    init(view: MovieListView) {
        movieUseCases = MovieUseCases()
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
    
    
}
