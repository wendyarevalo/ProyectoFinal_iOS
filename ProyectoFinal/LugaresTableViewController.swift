//
//  LugaresTableViewController.swift
//  ProyectoFinal
//
//  Created by Mac1 on 05/12/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import UIKit

class LugaresTableViewController: UITableViewController {

    var search : String?
    var location : String?
    var arrayLugares = Array<Lugar>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(lugaresResult(notification:)), name: NSNotification.Name(rawValue: "LugaresRetrieve"), object: nil)
        
        let con = LugarConexion(search: search!, location: location!, withDelivery: true)
        con.toDo()
        
        
    }
    
    @objc private func lugaresResult(notification : Notification){
        if let places = notification.userInfo!["lugares"]{
            arrayLugares = places as! Array<Lugar>
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayLugares.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restauranteCell", for: indexPath)

        cell.textLabel?.text = arrayLugares[indexPath.row].name!
        
        let dis = "Distancia: \(String(format: "%.3f", arrayLugares[indexPath.row].distance!)) m"
        cell.detailTextLabel?.text = dis

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue" {
            let detalleLugar = segue.destination as! DetalleViewController
            
            if let index = tableView.indexPathForSelectedRow?.row {
                detalleLugar.miLugar = arrayLugares[index]
            } else {
                return
            }
        }
        
    }

}
