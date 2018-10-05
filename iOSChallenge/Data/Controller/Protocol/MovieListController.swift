//
//  MovieListController.swift
//  iOSChallenge
//
//  Created by Mac on 04/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import Foundation

protocol MovieListController {
    var datasource: MovieDataSource! {get set}
    
    func getAllMovies(completion: @escaping ([Movie], Error?) -> Void)
    
    
}
