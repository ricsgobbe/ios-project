//
//  MovieDetailTableViewController.swift
//  iOSChallenge
//
//  Created by Mac on 05/10/18.
//  Copyright © 2018 Ricardo Sgobbe. All rights reserved.
//

import UIKit
import Reusable

class MovieDetailTableView: UITableViewController, StoryboardSceneBased {
    static var sceneStoryboard: UIStoryboard = UIStoryboard(name: "MovieDetailTableView", bundle: nil)

}

extension MovieDetailTableView {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MovieDetailTableView {
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
