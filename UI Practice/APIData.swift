//
//  APIData.swift
//  Crime Tracker
//
//  Created by user on 11/30/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit


    

struct CrimeReportData {
     let city: String
     let crimeCode: String
     let crimeDescription: String
     let crimeID: Int
     let datetime: String
}

// ARRAY OF TYPE CRIMEREPORTDATA
var CrimeReports = [CrimeReportData].self

class APIData: MainViewController {
    
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
     //var city: String = ""
    //RETRIEVE DATA METHOD
    func parseJSON() {
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=10"
        //URL FILTER ORDERS BY MOST RECENT
        let sortOrder = "&$order=datetime DESC"
        //URL FILTER ORDERS RESULTS BY CITY(GLOBAL VARIABLE)
        let userCity = "&city=\(city)"
       // print(MainViewController.CityString().city)
        
        let urlString = "https://data.acgov.org/resource/js8f-yfqf.json\(token)\(userCity)\(sortOrder)\(numberOfResults)"
        let FormattedUrlString = urlString.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: FormattedUrlString)
      
        
        let unwrappedURL = url
        //URL SESSION
        let session = URLSession.shared
        let task = session.dataTask(with: (unwrappedURL)!) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            do {
                let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String: AnyObject]]
                
                print("Got Data")
                print(jsonData)
                } catch {
                    
                    
                print(error)
            }
            
        }
        task.resume()
        
    }
}
    


