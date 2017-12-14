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

var crimeDescription1 = String()
var crimeDescription2 = String()
var crimeDescription3 = String()
var crimeDescription4 = String()
var crimeDescription5 = String()

var address1 = String()
var address2 = String()
var address3 = String()
var address4 = String()
var address5 = String()

var date1 = String()
var date2 = String()
var date3 = String()
var date4 = String()
var date5 = String()


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
                
                 let block1 = crimeDictionary1["block"]
                 let block2 = crimeDictionary2["block"]
                 let block3 = crimeDictionary3["block"]
                 let block4 = crimeDictionary4["block"]
                 let block5 = crimeDictionary5["block"]
                
                let crimeDescription1 = crimeDictionary1["crimedescription"]
                let crimeDescription2 = crimeDictionary2["crimedescription"]
                let crimeDescription3 = crimeDictionary3["crimedescription"]
                let crimeDescription4 = crimeDictionary4["crimedescription"]
                let crimeDescription5 = crimeDictionary5["crimedescription"]
                
                let date1 = crimeDictionary1["datetime"]
                let date2 = crimeDictionary2["datetime"]
                let date3 = crimeDictionary3["datetime"]
                let date4 = crimeDictionary4["datetime"]
                let date5 = crimeDictionary5["datetime"]
                
                 let state1 = crimeDictionary1["state"]
                 let state2 = crimeDictionary2["state"]
                 let state3 = crimeDictionary3["state"]
                 let state4 = crimeDictionary4["state"]
                 let state5 = crimeDictionary5["state"]
                
                
                let address1 = (String(describing: block1 ),"\(city)")
                let address2 = (String(describing: block2 ),"\(city)")
                let address3 = "\(block3 )\(city)"
                let address4 = "\(block4 )\(city)"
                let address5 = "\(block5 )\(city)"
                
                
                // ACESSING SPECIFIC VALUES BY USING THE KEY NAME OF DESIRED VALUE
                print(address1)
                
                
                //Trying to iterate through dictionary to pull out keys and values
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


