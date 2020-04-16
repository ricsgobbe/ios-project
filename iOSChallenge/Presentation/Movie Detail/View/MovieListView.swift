//
//  ViewController.swift
//  iOSChallenge
//
//  Created by Mac on 03/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift

class MovieListView: UIViewController, StoryboardBased {
    private lazy var viewModel: MovieListViewModel = MovieListViewModel()
    private lazy var movieList: [Movie] = []
    private var disposeBag = DisposeBag()
    
    private var refreshControl: UIRefreshControl!

    @IBOutlet weak var movieDetailTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        pullToRefreshSetup()
        searchSetup()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  private func bindToViewModel() {
    viewModel
      .allMovies.subscribe(onNext: { [unowned self] movies in
        self.movieList = movies
        self.movieDetailTableView.reloadData()
      })
    .disposed(by: disposeBag)

    viewModel
      .showAlert
      .subscribe(onNext: { [unowned self] alertType in
        AlertManager.createOneButtonAlert(controller: self, type: alertType)
        self.endSwipePull()
      })
    .disposed(by: disposeBag)

  }

     private func initialSetup() {
         tableViewSetup()
         bindToViewModel()
         tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
         loadingView.addGestureRecognizer(tapGesture)
         loadingView.isUserInteractionEnabled = true
     }

     private func tableViewSetup() {
         viewModel.getMovieList()
         movieDetailTableView.register(cellType: MovieListTableViewCell.self)
         movieDetailTableView.delegate = self
         movieDetailTableView.dataSource = self
         movieDetailTableView.estimatedRowHeight = MovieListTableViewCell.height
         movieDetailTableView.rowHeight = UITableViewAutomaticDimension
     }

     private func searchSetup() {
         searchBarSetup()
         navigationItem.searchController?.searchResultsUpdater = self
     }

}

extension MovieListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as MovieListTableViewCell
        let movie = movieList[indexPath.row]
        cell.render(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MovieListTableViewCell.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movieList[indexPath.row]
        //presenter.showMovieDetails(id: selectedMovie.id)
    }
}


extension MovieListView: MovieListViewDelegate {
    
    @objc func handleTap(sender: UITapGestureRecognizer?) {
        self.movieList.removeAll()
        viewModel.getMovieList()
    }
    
    func showMsg(message: AlertTypes) {

    }
    
    func showMovieList(movies: [Movie]) {

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
        viewModel.getMovieList()
    }
    
    
}

extension MovieListView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchedMovie = searchController.searchBar.text else {
            return
        }
        print("Searched Movie: " + searchedMovie)
    }
}

extension MovieListView: CustomNavigationControllerStylable {
    var customNavigationControllerStyle: CustomNavigationControllerStyle? {
        return CustomNavigationController()
    }
    
    
}

