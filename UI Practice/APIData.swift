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



//ARRAY OF MODEL TYPE CRIMEREPORT
var CrimeData = [CrimeReport]()


class APIData: MainViewController {
   
    //var info = "Testing"
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    
    //METHOD FOR BUILDING API URL
   public func buildUrl(constructedUrl: String) -> URL{
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
        //print(urlString)
        return url!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //URL SESSION PARSING JSON DATA
    func parseJSON() {
        let unwrappedURL = self.buildUrl(constructedUrl: urlString)
        //URL SESSION
        let session = URLSession.shared
        let task = session.dataTask(with: (unwrappedURL)) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            do {
              
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(Array<CrimeReport>.self, from: data!)
                //USE BELOW IF DECODER DOESNT WORK
                //JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                
                //CRIMEDATA IS AN ARRAY OF STRUCT TYPE CRIMEREPORT
                CrimeData = jsonData
                
                //PRINTING OUT CRIMEDATA ARRAY OF TYPE CRIMEREPORT
                //print(CrimeData)
  
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


