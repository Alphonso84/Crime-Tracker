//
//  APIData.swift
//  Crime Tracker
//
//  Created by user on 11/30/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit


    

struct CrimeReportData {
     var city: String
     var crimeCode: String
     var crimeDescription: String
     var crimeID: String
     var datetime: String
}

// ARRAY OF TYPE CRIMEREPORTDATA
//var CrimeReports = [Any].self
//EMPTY STRING FOR URL
var urlString = ""
//EMPTY ARRAY FOR JSON DATA
var crimeStats = [String: AnyObject]()

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
                let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String: AnyObject]]
                //CRIMESTATS SHEDS THE ARRAY AND BECOMES A DICTIONARY
                crimeStats = jsonData![0]
                
              
                
                print("Got Data")
                print(crimeStats)
                
                //Trying to iterate through dictionary to pull out keys and values
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


