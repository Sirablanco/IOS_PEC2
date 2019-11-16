//
//  MovementDetailViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementDetailViewController: UIViewController {
    // BEGIN-UOC-8.2
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stack1: UIStackView!
    var movement: Movement!
    
    let formatter = NumberFormatter()

    
    override func viewWillAppear(_ animated: Bool) {
        print ("ha pasado esto")
        print(movement.category)
        let amountItem = movement.amount
        var amountString = ""
        if let formattedString = formatter.string(for: amountItem) {
            amountString = formattedString
        }
        amount.text = amountString
        descriptionLabel.text = movement.movementDescription
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        formatos()

        print("y esto cuando?")
    }
    
    func formatos(){
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = ","
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
