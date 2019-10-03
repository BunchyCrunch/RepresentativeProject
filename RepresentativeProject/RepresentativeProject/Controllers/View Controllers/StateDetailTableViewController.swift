//
//  StateDetailTableViewController.swift
//  RepresentativeProject
//
//  Created by Josh Sparks on 10/3/19.
//  Copyright © 2019 Josh Sparks. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var representative: [Representative] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var state: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let state = state {
        RepresentativeContoller.searchRepresentatives(forState: state) { (repArray) in
            self.representative = repArray
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return representative.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "representativeCell", for: indexPath) as? RepresentativeTableViewCell else { return UITableViewCell() }

        let representatives = representative[indexPath.row]
        cell.representative = representatives
        return cell
    }
} // end of class
