//
//  DetalleViewController.swift
//  ProyectoFinal
//
//  Created by Damián Arévalo Orozco on 12/5/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    var miLugar : Lugar?
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageLugar: UIImageView!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var labelTel: UILabel!
    @IBOutlet weak var labelDistancia: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let lugar = miLugar{
            labelName.text = lugar.name!
            labelTel.text?.append(lugar.phone!)
            labelDistancia.text?.append("\(String(format: "%.3f", lugar.distance!)) m")
            do {
                let data = try Data(contentsOf: URL(string: lugar.img!)!)
                
                imageLugar.image = UIImage(data: data)
            } catch {
                print("Error al cargar la imagen")
            }
            
            if(lugar.rating! < 1.0){
                star1.image = UIImage(named: "empty_star")
                star2.image = UIImage(named: "empty_star")
                star3.image = UIImage(named: "empty_star")
                star4.image = UIImage(named: "empty_star")
                star5.image = UIImage(named: "empty_star")
            }else if (lugar.rating! < 2.0){
                star2.image = UIImage(named: "empty_star")
                star3.image = UIImage(named: "empty_star")
                star4.image = UIImage(named: "empty_star")
                star5.image = UIImage(named: "empty_star")
            }else if (lugar.rating! < 3.0){
                star3.image = UIImage(named: "empty_star")
                star4.image = UIImage(named: "empty_star")
                star5.image = UIImage(named: "empty_star")
            }else if (lugar.rating! < 4.0){
                star4.image = UIImage(named: "empty_star")
                star5.image = UIImage(named: "empty_star")
            }else if (lugar.rating! < 5.0){
                star5.image = UIImage(named: "empty_star")
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
