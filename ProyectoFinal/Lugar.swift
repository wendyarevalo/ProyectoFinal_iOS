//
//  Lugar.swift
//  ProyectoFinal
//
//  Created by Damián Arévalo Orozco on 12/3/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import Foundation
class Lugar{
    var id : String?
    var name : String?
    var imgURL : String?
    var delivery : Bool?
    
    init(id : String, name : String, imgURL : String, delivery : Bool) {
        self.id = id
        self.name = name
        self.imgURL = imgURL
        self.delivery = delivery
    }
}
