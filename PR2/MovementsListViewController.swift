//
//  MovementsListViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit
import Foundation


class MovementsListViewController: UITableViewController {
    // BEGIN-UOC-3
    var allItems = [Movement]() // datos de los movimientos
    let formatter = NumberFormatter()

    
    func formatos(){
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = ","
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allItems = Services.getMovements() // Inicializamos
        tableView.rowHeight = 75
        
        formatos() // Para poner los decimales en formato correcto
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
       
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovementCell",
                                                 for: indexPath) as! MovementCell
        let item = allItems[indexPath.row]
        let amount = item.amount
        let date = item.date
        
        var amountString = ""
        if let formattedString = formatter.string(for: amount) {
            amountString = formattedString
        }
        
        var dateString = ""
        if let date = dateFormatterGet.date(from: "\(date)") {
            dateString = dateFormatterPrint.string(from: date)
        }
        
        cell.Description.text = item.movementDescription
        cell.Date.text = dateString
        cell.Amount.text = amountString+" €"
        
        if (amount<0){
            cell.Amount.textColor = UIColor.red
        }else{
            cell.Amount.textColor = UIColor.black
        }
        
        

        
        
        return cell
    }
    // END-UOC-3
    

    
    
    // BEGIN-UOC-5
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("numero de elementos")
        return allItems.count
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
