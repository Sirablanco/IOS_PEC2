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
    var movement: Movement!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateValue: UILabel!
    @IBOutlet weak var valueLabelvalue: UILabel!
    @IBOutlet weak var valueLable: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var acountLabel: UILabel!
    @IBOutlet weak var stack1: UIStackView!

    let formatter = NumberFormatter()
    
    override func viewWillAppear(_ animated: Bool) {
    
        let amountItem = movement.amount
        let balanceItem = movement.balance
        let date = movement.date
        let date2 = movement.valueDate
        
        var color = UIColor.black
        if (amountItem<0){
            color = UIColor.red
        }
        var amountString = ""
        if let formattedString = formatter.string(for: amountItem) {
            amountString = formattedString
        }
        
        var balanceString = ""
        if let formattedString = formatter.string(for: balanceItem) {
            balanceString = formattedString
        }
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        
        var dateString = ""
        if let date = dateFormatterGet.date(from: "\(date)") {
            dateString = dateFormatterPrint.string(from: date)
        }
        
        var dateString2 = ""
        if let date2 = dateFormatterGet.date(from: "\(date2)") {
            dateString2 = dateFormatterPrint.string(from: date2)
        }
        
        amount.text = amountString
        amount.textColor = color
        descriptionLabel.text = movement.movementDescription
        
        
        dateLabel.text = "Date"
        dateValue.text = dateString
        
        valueLable.text = "Value date"
        valueLabelvalue.text = dateString2
        
        acountLabel.text = "Acount balance"
        balanceLabel.text = balanceString
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        formatos()
        preparaReject()

        print("y esto cuando?")
    }
    
    func formatos(){
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = ","
    }
    // END-UOC-8.2
    
    // BEGIN-UOC-9
    let rejectLabelView : UILabel = {
        let labelView = UILabel()
        labelView.text = "Rejected"
        labelView.font = UIFont.systemFont(ofSize: 18)
        labelView.textColor = .red
        // activa autolayout
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.textAlignment = .center
        return labelView
    }()
    let rejectButton : UIButton = {
        let button = UIButton()
        button.setTitle("Reject", for:.normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(rejectAction), for: .touchUpInside)
        // activa autolayout
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
   
    
    func preparaReject(){
        if movement.rejected {
            view.addSubview(rejectLabelView)
            // layout
            rejectLabelView.topAnchor.constraint(equalTo: acountLabel.bottomAnchor, constant: 20).isActive = true
            rejectLabelView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            rejectLabelView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            rejectLabelView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }else{
            view.addSubview(rejectButton)
            // layout
            rejectButton.topAnchor.constraint(equalTo: acountLabel.bottomAnchor, constant: 10).isActive = true
            rejectButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            rejectButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
            rejectButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            // action del button
    
        }
        print ("esto si lo hace")
        
    }
    @objc func rejectAction(sender: UIButton!) {
        movement.rejected = true
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    // END-UOC-9
}
