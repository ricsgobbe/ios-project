//
//  ViewController.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable

protocol MovieListViewProtocol {
    var presenter: MovieListPresenterProtocol! {get set}
    
    func showMovieList(movies: [Movie])
    
}

class MovieListView: UIViewController, StoryboardBased {
    var presenter: MovieListPresenterProtocol!
    var movieList: [Movie]?

    @IBOutlet weak var movieDetailTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
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
    func showMovieList(movies: [Movie]) {
        self.movieList = movies
        self.movieDetailTableView.reloadData()
    }
    
    
}

