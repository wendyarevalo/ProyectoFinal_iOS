//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by Damián Arévalo Orozco on 12/2/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var search: UITextField!
    
    @IBOutlet weak var location: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buscar(_ sender: UIButton) {
        let con = LugarConexion(search: search.text ?? "torta", location: location.text ?? "Mexico", withDelivery: true)
        con.toDo()
    }
    
}

