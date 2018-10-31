//
//  UIViewExtension.swift
//  CodeChallenge
//
//  Created by Mac on 03/09/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Alamofire

extension UIViewController {
    
    func changeBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    func searchBarSetup() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Movies"
        searchController.searchBar.tintColor = .white
        searchController.searchBar.barTintColor = .white
        navigationItem.hidesSearchBarWhenScrolling = false
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            let backgroundView = textField.subviews.first
            backgroundView?.backgroundColor = .white
            backgroundView?.layer.cornerRadius = 10;
            backgroundView?.clipsToBounds = true;
        }
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
    }
}
