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
    //var lugares = [Lugar]()
    var withDelivery = false
    
    init(search : String, location : String, withDelivery : Bool) {
        url = "https://api.yelp.com/v3/businesses/search?term=\(search)&location=\(location)"
        self.withDelivery = withDelivery
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
            
            
            do{
                let parseResult = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
                let venuesData = try JSONSerialization.data(withJSONObject: parseResult["businesses"]!, options: [])
                let venues = try JSONSerialization.jsonObject(with: venuesData, options: []) as! Array<AnyObject>
                //print(venues)
                
                let venueData = try JSONSerialization.data(withJSONObject: venues[0], options: [])
                let venue = try JSONSerialization.jsonObject(with: venueData, options: []) as! [String:Any]
                //print(venue)
                
                print(venue["name"]!)
                print(venue["id"]!)
                print(venue["image_url"]!)
                
                let transData = try JSONSerialization.data(withJSONObject: venue["transactions"]!, options: [])
                let transaction = try JSONSerialization.jsonObject(with: transData, options: []) as! Array<AnyObject>
                print(transaction)
                
                if(self.withDelivery && transaction.count > 0){
                    
                }
                
            } catch {
                print("Could not parse data as Json \(error)")
            }
            
            
            
            }.resume()    }
}
