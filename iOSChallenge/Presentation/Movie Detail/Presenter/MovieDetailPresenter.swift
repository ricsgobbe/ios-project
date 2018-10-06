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
    
    
}
