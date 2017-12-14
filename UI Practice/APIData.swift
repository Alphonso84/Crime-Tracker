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
    var crimeDescription = String()
    var crimeDate = String()
    var crimeZip = String()
    var crimeState = String()
    var crimeCity = String()
    var crimeBlock = String()
let keys = String()
let values = String()
    
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
var CrimeArray = [[String:Any]]()
var CArray = [CrimeReport( crimeDescription: "crimedescription", crimeDate: "datetime", crimeZip: "zip", crimeState: "state", crimeCity: "city", crimeBlock: "block")]
//DICTIONARY FROM JSON DATA
var crimeStats = [Any]()

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
                let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                //CRIMESTATS SHEDS THE ARRAY by using [0] AND BECOMES A DICTIONARY
                crimeStats = jsonData!
            
                
                 let crimeReport = CrimeReport(crimeDescription: "crimedescription", crimeDate: "datetime", crimeZip: "zip", crimeState:"state", crimeCity: "city", crimeBlock: "block")
                CrimeArray.append(crimeStats[0] as! [String : Any])
                CrimeArray.append(crimeStats[1] as! [String : Any])
                CrimeArray.append(crimeStats[2] as! [String : Any])
                CrimeArray.append(crimeStats[3] as! [String : Any])
         
               var CrimeArrayString = CrimeArray.description
                
                
                
                
              
                print(CrimeArrayString)
              
                
                //Trying to iterate through dictionary to pull out keys and values
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


