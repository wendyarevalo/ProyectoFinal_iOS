//
//  LugarConexion.swift
//  ProyectoFinal
//
//  Created by Damián Arévalo Orozco on 12/3/18.
//  Copyright © 2018 Wendy Arevalo. All rights reserved.
//

import Foundation

class LugarConexion{
    var url = ""
    var apiKey = "i-Rr3a5BonCE9qw8GrzbiMqbynL0OHVlKJBCemIymDOHAJZy75q8CzeEMWkvfF9IajoVVwrGsTuO9EqmqDBTOf87CtOvavSqSUE7xTIlGS2K4DddFN4LQw2MMK8EXHYx"
    var lugares = [Lugar]()
    var withDelivery = false
    
    init(search : String, location : String, withDelivery : Bool) {
        url = "https://api.yelp.com/v3/businesses/search?term=\(search)&location=\(location)"
    }
    func toDo(){
        let session = URLSession.shared
        let apiURL = URL(string: url)!
        var request = URLRequest(url: apiURL)
        
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        
        session.dataTask(with: request){ data, response, error in
            guard(error == nil) else {
                print("\(String(describing: error))")
                return
            }
            //result
            let parseResult: [String:AnyObject]!
            do{
                parseResult = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:AnyObject]
                print(parseResult!)
            } catch {
                print("Could not parse data as Json \(error)")
            }
            
            }.resume()    }
}
