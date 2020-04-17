//
//  MovieListPresenter.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import RxSwift
import UIKit

class MovieListViewModel: NSObject {
    private let movieUseCases: MovieUseCases

    lazy var allMovies = PublishSubject<[Movie]>()
    lazy var showAlert = PublishSubject<AlertTypes>()
    lazy var showErrorMessage = PublishSubject<String>()
    lazy var startLoading = PublishSubject<Bool>()
    
    init(movieUseCases: MovieUseCases = MovieUseCases()) {
      self.movieUseCases = movieUseCases
      super.init()
    }
    
    func getMovieList() {
        startLoading.onNext(true)
        movieUseCases.fetchMovieList { [weak self] (response, error) in
          self?.displayingValues(movies: response, error: error)
        }
    }
    
    fileprivate func displayingValues(movies: [Movie], error: Error?) {
        if error != nil {
            showAlert.onNext(.error)
            showErrorMessage.onNext("Tap on the screen to reload.")
        } else {
            if movies.isEmpty {
                showErrorMessage.onNext("No item was found.")
            } else {
                startLoading.onNext(false)
                allMovies.onNext(movies)
            }
        }
    }
}
