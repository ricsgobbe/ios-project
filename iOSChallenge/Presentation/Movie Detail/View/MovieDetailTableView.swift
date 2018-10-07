//
//  MovieDetailTableViewController.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable


protocol MovieDetailTableViewProtocol: class, LoadingView {
    var movieDetails: MovieDetail! {get set}
    var presenter: MovieDetailPresenterProtocol! {get set}
    
    func displayDetails(detail: MovieDetail)
    func showMsg(message: AlertTypes)
}

class MovieDetailTableView: UITableViewController, StoryboardSceneBased {
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: "MovieDetailTableView", bundle: nil)
    
    var presenter: MovieDetailPresenterProtocol!
    var loadingView: UIView!
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
        if (movieDetails) != nil {
            return PosterImageTableViewCell.height
        }
        return 0.0
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
    func showMsg(message: AlertTypes) {
        AlertManager.createOneButtonAlert(controller: self, type: message)
    }
    
    func displayDetails(detail: MovieDetail) {
        self.movieDetails = detail
        self.tableView.reloadData()
    }
    
    
}

extension MovieDetailTableView {
    
    func getMovieDetail(id: Int) {
        loadViewSetup()
        self.startLoading()
        presenter = MovieDetailPresenter(view: self)
        presenter.getMovieDetail(id: id)
    }
    
    fileprivate func initialSetup() {
        self.tableView.register(cellType: PosterImageTableViewCell.self)
        self.tableView.register(cellType: MovieInfoTableViewCell.self)
    }
    
    fileprivate func loadViewSetup() {
        loadingView = UIView()
        loadingView.frame = .zero
        view.addSubview(loadingView)
        view.bringSubview(toFront: loadingView)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        let width = self.tableView.frame.width
        let height = self.tableView.frame.height
        let horizontalConstraint = loadingView.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor)
        let verticalConstraint = loadingView.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor)
        let widthConstraint = loadingView.widthAnchor.constraint(equalToConstant: width)
        let heightConstraint = loadingView.heightAnchor.constraint(equalToConstant: height)
        view.addConstraints([widthConstraint, heightConstraint, horizontalConstraint, verticalConstraint])
    }
}



