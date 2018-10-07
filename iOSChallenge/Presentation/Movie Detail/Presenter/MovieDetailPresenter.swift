//
//  MovieDetailPresenter.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation

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
                if let movieDetails = result {
                    self?.view.stopLoading()
                    self?.databaseUseCase.insertMovieDetails(movieDetail: movieDetails)
                    self?.view.displayDetails(detail: movieDetails)
                }
            }
        } else {
            databaseUseCase.getMovieDetailInDB(id: id) { [weak self] (result, error) in
                if let movieDetails = result {
                    self?.view.stopLoading()
                    self?.databaseUseCase.insertMovieDetails(movieDetail: movieDetails)
                    self?.view.displayDetails(detail: movieDetails)
                }
            }
        }
    }
    
    
    fileprivate func isConnectedToInternet() -> Bool {
        return NetworkManager.isConnectedToInternet()
    }
    
}
