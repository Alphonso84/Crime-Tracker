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
var CrimeReports = [String:AnyObject].self
var urlString = ""

class APIData: MainViewController {
    
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    
    //METHOD FOR BUILDING API URL
    func buildUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=10"
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
                let crimeStats = jsonData![0]
                
                print("Got Data")
                print(crimeStats)
                } catch {
                    
                    
                print(error)
            }
            
        }
        task.resume()
        
    }
}
    


