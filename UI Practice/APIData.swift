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
//STRUCT MODEL FOR JSON DATA


class CrimeReport {
    var crimeDescription = String() as Any
    var crimeDate = String() as Any
    var crimeZip = String() as Any
    var crimeState = String() as Any
    var crimeCity = String() as Any
    var crimeBlock = String() as Any
let keys = String()
let values = String() as Any
    
    init(crimeDescription: String, crimeDate: String, crimeZip: String, crimeState: String, crimeCity: String, crimeBlock: String) {
        self.crimeDescription = crimeDescription
        self.crimeDate = crimeDate
        self.crimeCity = crimeCity
        self.crimeBlock = crimeBlock
        self.crimeZip = crimeZip
        self.crimeState = crimeState
        
        
    }
}

//ARRAY OF STRUCT CRIMEREPORT
var CrimeArray = [CrimeReport].self
//DICTIONARY FROM JSON DATA
var crimeStats = [String]()

class APIData: MainViewController {
   
    var info = "Testing"
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    
    //METHOD FOR BUILDING API URL
    func buildUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=5"
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
                let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String]
                //CRIMESTATS SHEDS THE ARRAY by using [0] AND BECOMES A DICTIONARY
                crimeStats = jsonData!
                
                 let crimeReport = CrimeReport(crimeDescription: "crimedescription", crimeDate: "datetime", crimeZip: "zip", crimeState:"state", crimeCity: "city", crimeBlock: "block")
                
                var firstReport = crimeStats[0] as! CrimeReport
                var secondReport = crimeStats[1] as! CrimeReport
                var thirdReport = crimeStats[2] as! CrimeReport
                var fourthReport = crimeStats[3] as! CrimeReport
                var fifthReport = crimeStats[4] as! CrimeReport
                var sixthReport = crimeStats[5] as! CrimeReport
                
                
                
            
            
               
                
               
                
                
               
                
                
               // print(values)
                // print(crimeDate)
//                print(crimeBlock)
//                print(crimeCity)
//                print(crimeState)
//                //print(crimeZip)
                print(thirdReport)
                //print(crimeStats["location_1"])
              
                
                //Trying to iterate through dictionary to pull out keys and values
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


