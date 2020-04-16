//
//  MovieDetailPresenter.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit

protocol MovieDetailPresenterProtocol: class {
    var view: MovieDetailTableViewProtocol! {get set}
    var movieUseCase: MovieUseCases! {get set}
    var databaseUseCase: MovieDatabaseUseCase! {get set}
    
    func getMovieDetail(id: Int)
    
    
}


class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var databaseUseCase: MovieDatabaseUseCase!
    var view: MovieDetailTableViewProtocol!
    var movieUseCase: MovieUseCases!
    
    init(view: MovieDetailTableViewProtocol) {
        self.view = view
        databaseUseCase = MovieDatabaseUseCase()
        movieUseCase = MovieUseCases()
    }
    
    func getMovieDetail(id: Int) {
        if isConnectedToInternet() {
            movieUseCase.getMovieWith(id: id) { [weak self] (result, error) in
                self?.displayingValues(details: result, error: error)            }
        } else {
            databaseUseCase.getMovieDetailInDB(id: id) { [weak self] (result, error) in
                self?.displayingValues(details: result, error: error)
            }
        }
    }
    
    fileprivate func displayingValues(details: MovieDetail?, error: Error?) {
        if error == nil {
            if let movieDetails = details {
                self.view.stopLoading()
                self.databaseUseCase.insertMovieDetails(movieDetail: movieDetails)
                self.view.displayDetails(detail: movieDetails)
            } else {
                self.view.showError(message: "No item was found.")
            }
        } else {
            self.view.showMsg(message: .error)
            self.view.showError(message: "Tap on the screen to reload.")
        }
    }
    
    
    fileprivate func isConnectedToInternet() -> Bool {
        return NetworkManager.isConnectedToInternet(controller: view as! UIViewController)
    }
    
}
