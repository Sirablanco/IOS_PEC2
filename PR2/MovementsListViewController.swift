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
    var filteredItems = [Movement]()
    let formatter = NumberFormatter()

    func formatos(){
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        formatter.decimalSeparator = ","
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allItems = Services.getMovements() // Inicializamos
        filteredItems = allItems
        tableView.rowHeight = 75 // revisar esto cuando tenga el otro tipo
        /*tableView.rowHeight = UITableViewAutomaticDimension tableView.estimatedRowHeight = 75*/
        formatos() // Para poner los decimales en formato correcto
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd"
 
        /*
        let cell = tableView.dequeueReusableCell(withIdentifier: "LastMovementCell",for: indexPath) as! LastMovementCell
        cell.lastMovement.text = "End of movements"
 
        if (indexPath.row < allItems.count) {  // poner filteredItems.count
         */
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovementCell",for: indexPath) as! MovementCell
        //let item = allItems[indexPath.row]
        let item = filteredItems[indexPath.row]
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
        
        if (item.rejected){
           cell.backgroundColor = UIColor(red: 1, green: 0.74, blue: 0.3, alpha: 1)
        }else{
           cell.backgroundColor = .white
        }
        
        //}
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
        return filteredItems.count  //+1
    }

    // END-UOC-5
    
    // BEGIN-UOC-7
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        // Obtenemos la descripción del índice del texto del segmentControl
        // Al array filtrado, le asignamo el de todos los elementos
        // Si el segmentControl es != all, filtramos el array con la descripción
        // Finalmente, lanzamos el reload Data
        let valorFiltro = segmentedControl.titleForSegment(at: sender.selectedSegmentIndex) ?? "All"
        print(valorFiltro)
        
        filteredItems = allItems
        if valorFiltro != "All" {
            filteredItems = allItems.filter { $0.category == valorFiltro }
        }

        tableView.reloadData()
        
    }
    // END-UOC-7
  
    
    // BEGIN-UOC-8.1
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "SegueToMovementDetail",
            let destination = segue.destination as? MovementDetailViewController,
            let rowIndex = tableView.indexPathForSelectedRow?.row
        {
            print("entra en el prepare")
            destination.movement = filteredItems[rowIndex]
        }
    }
    /*
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print ("se ha despulsado")
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        print("he pulsado")
        print ([indexPath.row])
        print(filteredItems[indexPath.row])
    }
 */
    
    // END-UOC-8.1
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}
