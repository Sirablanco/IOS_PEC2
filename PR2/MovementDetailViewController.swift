//
//  MovementDetailViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementDetailViewController: UIViewController {
    // BEGIN-UOC-8.2
    var movement: Movement!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // END-UOC-8.2
    
    // BEGIN-UOC-9
    func rejectAction(sender: UIButton!) {        
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    // END-UOC-9
}
