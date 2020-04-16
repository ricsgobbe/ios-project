//
//  MovieListPresenter.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import RxSwift
import UIKit

protocol MovieListPresenterProtocol: class {
    var view: MovieListViewDelegate! {get set}
    var movieUseCases: MovieUseCases! {get set}
    var databaseUseCase: MovieDatabaseUseCase! {get set}
    var navigator: MovieListNavigator! {get set}
    
    func getMovieList()
    func showMovieDetails(id: Int)
}

class MovieListViewModel: NSObject {
    private let movieUseCases: MovieUseCases

    lazy var delegate: MovieListViewDelegate? = nil
    lazy var allMovies = PublishSubject<[Movie]>()
    lazy var showAlert = PublishSubject<AlertTypes>()
    lazy var showErrorMessage = PublishSubject<String>()
    
    
    init(movieUseCases: MovieUseCases = MovieUseCases()) {
      self.movieUseCases = movieUseCases
      super.init()
    }
    
    func getMovieList() {
        delegate?.startLoading()
        if true {
            movieUseCases.fetchMovieList { [weak self] (response, error) in
                self?.displayingValues(movies: response, error: error)
            }
        } else {
//            databaseUseCase.fetchMovie { [weak self] (movies, error) in
//                self?.displayingValues(movies: movies, error: error)
//            }
        }
        
    }
    
    func showMovieDetails(id: Int) {

    }
    
    fileprivate func displayingValues(movies: [Movie], error: Error?) {
        if error != nil {
            //self.delegate?.showMsg(message: .error)
            showAlert.onNext(.error)
            showErrorMessage.onNext("Tap on the screen to reload.")
            //self.delegate?.showError(message: "Tap on the screen to reload.")
        } else {
            if movies.isEmpty {
                //self.delegate?.showError(message: "No item was found.")
                showErrorMessage.onNext("No item was found.")
            } else {
                self.delegate?.stopLoading()
                allMovies.onNext(movies)
                //self.delegate.showMovieList(movies: movies)
            }
        }
    }
}


protocol MovieListViewDelegate: LoadingView {
    //var presenter: MovieListPresenterProtocol! {get set}

    func showMovieList(movies: [Movie])
    func showMsg(message: AlertTypes)
}
