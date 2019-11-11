//
//  MovementsListViewController.swift
//  PR2
//
//  Copyright © 2018 UOC. All rights reserved.
//

import UIKit

class MovementsListViewController: UITableViewController {
    // BEGIN-UOC-3
    var allItems = [Movement]() // datos de los movimientos
    override func viewDidLoad() {
        super.viewDidLoad()
        allItems = Services.getMovements() // Inicializamos
        print(allItems.count)
        print(allItems[0].movementDescription)
        print(allItems[0].date)
        let prueba = allItems[0].date
        
        //
        print("prueba antes...")
        print(prueba)
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
        print ("prueba")
        if let date = dateFormatterGet.date(from: "\(prueba)") {
            print(dateFormatterPrint.string(from: date))
        } else {
            print("There was an error decoding the string")
        }
        //
    
        tableView.rowHeight = 75
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovementCell",
                                                 for: indexPath) as! MovementCell
        let item = allItems[indexPath.row]
        cell.Description.text = item.movementDescription
        cell.Date.text = "\(item.date)"
        cell.Amount.text = "\(item.amount) €"
        
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
