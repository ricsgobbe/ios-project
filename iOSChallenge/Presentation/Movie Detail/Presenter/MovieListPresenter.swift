//
//  MovieListPresenter.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit

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
        view.startLoading()
        if isConnectedToInternet() {
            movieUseCases.fetchMovieList { [weak self] (response, error) in
                self?.displayingValues(movies: response, error: error)
            }
        } else {
            databaseUseCase.fetchMovie { [weak self] (movies, error) in
                self?.displayingValues(movies: movies, error: error)
            }
        }
        
    }
    
    func showMovieDetails(id: Int) {
        navigator.goToMovieDetails(id)
        
    }
    
    fileprivate func displayingValues(movies: [Movie], error: Error?) {
        if error != nil {
            self.view.showMsg(message: .error)
            self.view.showError(message: "Tap on the screen to reload.")
        } else {
            if movies.isEmpty {
                self.view.showError(message: "No item was found.")
            } else {
                self.view.stopLoading()
                self.view.showMovieList(movies: movies)
            }
        }
    }
    
    fileprivate func isConnectedToInternet() -> Bool {
        return NetworkManager.isConnectedToInternet(controller: view as! UIViewController)
    }
    
}
