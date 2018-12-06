//
//  Lugar.swift
//  ProyectoFinal
//
//  Created by Damián Arévalo Orozco on 12/3/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import Foundation
class Lugar{
    var name : String?
    var img : String?
    var phone : String?
    var rating : Double?
    var distance : Double?
    var delivery : Bool?
    
    init(name : String, img : String, phone : String, rating : Double, distance : Double, delivery : Bool) {
        self.name = name
        self.img = img
        self.phone = phone
        self.rating = rating
        self.distance = distance
        self.delivery = delivery
    }
}
