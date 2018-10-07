//
//  MovieListNavigator.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit

class MovieListNavigator {
    
     var view: MovieListViewProtocol!
    
    init(_ view: MovieListViewProtocol) {
       self.view = view
    }
    
    func goToMovieDetails(_ id: Int) {
        if let viewController = view as? UIViewController {
            let movieDetailVC = MovieDetailTableView.instantiate()
            if let navigationController = viewController.navigationController {
                navigationController.pushViewController(movieDetailVC, animated: true)
                movieDetailVC.getMovieDetail(id: id)
            }
        }
    }
    
}
