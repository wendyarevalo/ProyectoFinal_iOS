//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by Damián Arévalo Orozco on 12/2/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fieldSearch: UITextField!
    
    @IBOutlet weak var fieldLocation: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buscar(_ sender: UIButton) {
        let con = LugarConexion(search: fieldSearch.text ?? "torta", location: fieldLocation.text ?? "Mexico", withDelivery: true)
        con.toDo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Se obtiene la busqueda
        guard let search = fieldSearch.text else { return }
        guard let location = fieldLocation.text else { return }
        
        // Se busca que sea la transicion correcta
        if segue.identifier == "searchSegue" {
            // Se crea la instancia
            let lugaresController = segue.destination as! LugaresTableViewController
            
            lugaresController.search = search
            lugaresController.location =  location
            
        }
    }
    
}

