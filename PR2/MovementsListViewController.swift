//
//  MovementsListViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementsListViewController: UITableViewController {
    // BEGIN-UOC-3
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.rowHeight = 75
    }
    // END-UOC-3
    

    
    
    // BEGIN-UOC-5
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    // END-UOC-5
    
    // BEGIN-UOC-7
    // END-UOC-7
    
    // BEGIN-UOC-8.1
    // END-UOC-8.1
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}
