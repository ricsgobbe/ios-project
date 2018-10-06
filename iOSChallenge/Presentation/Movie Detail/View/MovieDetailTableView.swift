//
//  MovieDetailTableViewController.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable


protocol MovieDetailTableViewProtocol: class {
    var movieDetails: MovieDetail! {get set}
}

class MovieDetailTableView: UITableViewController, StoryboardSceneBased {
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: "MovieDetailTableView", bundle: nil)
    
    var movieDetails: MovieDetail!
}

extension MovieDetailTableView {
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MovieDetailTableView {
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = PosterImageTableViewCell.loadFromNib()
        if let detail = movieDetails {
            headerView.render(poster: detail.backdrop, and: detail.posterUrl)
        }
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return PosterImageTableViewCell.height
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieInfoTableViewCell
        if let details = movieDetails {
            cell.render(movieDetail: details)
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

extension MovieDetailTableView: MovieDetailTableViewProtocol {
    
}

extension MovieDetailTableView {
    
    fileprivate func initialSetup() {
        self.tableView.register(cellType: PosterImageTableViewCell.self)
        self.tableView.register(cellType: MovieInfoTableViewCell.self)
    }
}



