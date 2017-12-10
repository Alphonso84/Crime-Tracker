//
//  APIData.swift
//  Crime Tracker
//
//  Created by user on 11/30/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit



//EMPTY STRING FOR URL
var urlString = ""
//EMPTY STRUCT FOR JSON DATA


struct CrimeReport {
var crimeDescription = String() as Any
var crimeDate = Date() as Any
var crimeZip = Float() as Any
var crimeState = String() as Any
var crimeCity = String() as Any
var crimeBlock = String() as Any
var keys = String()
var values = String() as Any
}
var CrimeArray = [CrimeReport].self

var crimeStats = [String:Any]()

class APIData: MainViewController {
   
    var info = "Testing"
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    
    //METHOD FOR BUILDING API URL
    func buildUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=20"
        //URL FILTER ORDERS BY MOST RECENT
        let sortOrder = "&$order=datetime DESC"
        //URL FILTER ORDERS RESULTS BY CITY(GLOBAL VARIABLE)
        let userCity = "&city=\(city)"
       // print(MainViewController.CityString().city)
        
        urlString = "\(baseURL)\(token)\(userCity)\(sortOrder)\(numberOfResults)"
        let FormattedUrlString = urlString.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: FormattedUrlString)
        return url!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func parseJSON() {
        let unwrappedURL = buildUrl(constructedUrl: urlString)
        //URL SESSION
        let session = URLSession.shared
        let task = session.dataTask(with: (unwrappedURL)) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            do {
                //JSONDATA IS AN ARRAY OF DICTIONARIES
                let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                //CRIMESTATS SHEDS THE ARRAY by using [0] AND BECOMES A DICTIONARY
                crimeStats = jsonData![0]
                
                
                crimeDescription = crimeStats.
                coordinate = crimeStats["location_1"]
                crimeStats = crimeStats["datetime"]!
                //crimeZip = crimeStats["zip"]!
                crimeState = crimeStats["state"]!
                crimeCity = crimeStats["city"]!
                crimeBlock = crimeStats["block"]!
                for (key , value) in crimeStats {
                    values = (value)
                    keys = (key)
                    
                }
                
                
               // print(values)
                // print(crimeDate)
//                print(crimeBlock)
//                print(crimeCity)
//                print(crimeState)
//                //print(crimeZip)
                print(jsonData![1])
                //print(crimeStats["location_1"])
              
                
                //Trying to iterate through dictionary to pull out keys and values
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


