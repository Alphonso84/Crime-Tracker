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



//ARRAY OF DICTIONARIES
var CrimeArray = [[String:Any]]()

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
              
                let jsonData = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                  //JSONDATA IS AN ARRAY OF DICTIONARIES
                CrimeArray = jsonData!
                
                  // ACESSING THE DICTIONARIES IN THE ARRAY(The first dictionary is the most recent by default)
                var crimeDictionary1 = CrimeArray[0]
                var crimeDictionary2 = CrimeArray[1]
                var crimeDictionary3 = CrimeArray[2]
                var crimeDictionary4 = CrimeArray[3]
                var crimeDictionary5 = CrimeArray[4]
                
                
                
                  // ACESSING SPECIFIC VALUES BY USING THE KEY NAME OF DESIRED VALUE
                print(crimeDictionary1["crimedescription"])
                print(crimeDictionary1["block"])
                print(crimeDictionary1["datetime"])
                print(crimeDictionary1["city"])
                
                
                //Trying to iterate through dictionary to pull out keys and values
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


