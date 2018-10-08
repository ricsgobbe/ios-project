//
//  ViewController.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable

protocol MovieListViewProtocol: LoadingView {
    var presenter: MovieListPresenterProtocol! {get set}

    func showMovieList(movies: [Movie])
    func showMsg(message: AlertTypes)
}

class MovieListView: UIViewController, StoryboardBased {
    var presenter: MovieListPresenterProtocol!
    var movieList: [Movie]?
    
    var refreshControl: UIRefreshControl!

    @IBOutlet weak var movieDetailTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        pullToRefreshSetup()
        // Do any additiona l setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension MovieListView {
    fileprivate func initialSetup() {
        tableViewSetup()
        presenter = MovieListPresenter(view: self)
        presenter.getMovieList()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        loadingView.addGestureRecognizer(tapGesture)
        loadingView.isUserInteractionEnabled = true
    }
    
    fileprivate func tableViewSetup() {
        movieDetailTableView.register(cellType: MovieListTableViewCell.self)
        movieDetailTableView.delegate = self
        movieDetailTableView.dataSource = self
        movieDetailTableView.estimatedRowHeight = MovieListTableViewCell.height
        movieDetailTableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension MovieListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieListTableViewCell
        let movie = movieList![indexPath.row]
        cell.render(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movies = self.movieList else {
            return 0
        }
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MovieListTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movieList![indexPath.row]
        presenter.showMovieDetails(id: selectedMovie.id)
    }
    
}


extension MovieListView: MovieListViewProtocol {
    
    @objc func handleTap(sender: UITapGestureRecognizer?) {
        self.movieList?.removeAll()
        presenter.getMovieList()
    }
    
    func showMsg(message: AlertTypes) {
        AlertManager.createOneButtonAlert(controller: self, type: message)
        endSwipePull()
    }
    
    func showMovieList(movies: [Movie]) {
        endSwipePull()
        self.movieList = movies
        self.movieDetailTableView.reloadData()
    }
    
    fileprivate func pullToRefreshSetup() {
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = ColorPalette.mainColor
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        movieDetailTableView.addSubview(refreshControl)
    }
    
    fileprivate func endSwipePull(){
        if refreshControl != nil {
             self.refreshControl.endRefreshing()
        }
    }
    
    @objc func refresh(_ sender: Any) {
        presenter.getMovieList()
    }
    
    
}

extension MovieListView: CustomNavigationControllerStylable {
    var customNavigationControllerStyle: CustomNavigationControllerStyle? {
        return CustomNavigationController()
    }
    
    
}

