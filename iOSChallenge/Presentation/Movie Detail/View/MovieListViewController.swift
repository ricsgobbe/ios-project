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

class MovieListViewController: UIViewController, StoryboardBased {
    private lazy var viewModel: MovieListViewModel = MovieListViewModel()
    private lazy var movieList: [Movie] = []
    private var disposeBag = DisposeBag()
    
    private lazy var refreshControl: UIRefreshControl = UIRefreshControl()

    @IBOutlet weak var movieDetailTableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    
    var tapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        pullToRefreshSetup()
        searchSetup()
    }

  private func bindToViewModel() {
    viewModel
      .allMovies
      .asObservable()
      .bind(to: movieDetailTableView.rx.items(cellIdentifier: "MovieListTableViewCell", cellType: MovieListTableViewCell.self)) { [unowned self] row, element, movieCell in
        // TODO: move this code to an operator
        self.refreshControl.endRefreshing()
        movieCell.render(movie: element)
        movieCell.layoutIfNeeded()
    }
    .disposed(by: disposeBag)

    viewModel
      .showAlert
      .subscribe(onNext: { [unowned self] alertType in
        AlertManager.createOneButtonAlert(controller: self, type: alertType)
        self.refreshControl.endRefreshing()
      })
    .disposed(by: disposeBag)
  }

     private func initialSetup() {
         tableViewSetup()
         bindToViewModel()
         loadingView.isUserInteractionEnabled = true
     }

     private func tableViewSetup() {
         viewModel.getMovieList()
         movieDetailTableView.register(cellType: MovieListTableViewCell.self)
         movieDetailTableView.rowHeight = UITableViewAutomaticDimension
     }

     private func searchSetup() {
         searchBarSetup()
         navigationItem.searchController?.searchResultsUpdater = self
     }

  private func pullToRefreshSetup() {
      refreshControl.tintColor = ColorPalette.mainColor
      refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
      movieDetailTableView.addSubview(refreshControl)
  }

  @IBAction func handleClickOnLoadView(_ sender: Any) {
    viewModel.getMovieList()
  }

  @objc func refresh(_ sender: Any) {
         viewModel.getMovieList()
     }
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchedMovie = searchController.searchBar.text else {
            return
        }
        print("Searched Movie: " + searchedMovie)
    }
}

extension MovieListViewController: CustomNavigationControllerStylable {
    var customNavigationControllerStyle: CustomNavigationControllerStyle? {
        return CustomNavigationController()
    }
}

