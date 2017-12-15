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

var block1 = String()
var block2 = String()
var block3 = String()
var block4 = String()
var block5 = String()

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

var state1 = String()
var state2 = String()
var state3 = String()
var state4 = String()
var state5 = String()


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
                
                 block1 = crimeDictionary1["block"] as! String
                 block2 = crimeDictionary2["block"] as! String
                 block3 = crimeDictionary3["block"] as! String
                 block4 = crimeDictionary4["block"] as! String
                 block5 = crimeDictionary5["block"] as! String
                
                crimeDescription1 = crimeDictionary1["crimedescription"] as! String
                crimeDescription2 = crimeDictionary2["crimedescription"] as! String
                crimeDescription3 = crimeDictionary3["crimedescription"] as! String
                crimeDescription4 = crimeDictionary4["crimedescription"] as! String
                crimeDescription5 = crimeDictionary5["crimedescription"] as! String
                
                date1 = crimeDictionary1["datetime"] as! String
                date2 = crimeDictionary2["datetime"] as! String
                date3 = crimeDictionary3["datetime"] as! String
                date4 = crimeDictionary4["datetime"] as! String
                date5 = crimeDictionary5["datetime"] as! String
                
                 state1 = crimeDictionary1["state"] as! String
                 state2 = crimeDictionary2["state"] as! String
                 state3 = crimeDictionary3["state"] as! String
                 state4 = crimeDictionary4["state"] as! String
                 state5 = crimeDictionary5["state"] as! String
                
                
                address1 = "\(block1)\(" ")\(city)"
                address2 = "\(block2 )\(" ")\(city)"
                address3 = "\(block3 )\(" ")\(city)"
                address4 = "\(block4 )\(" ")\(city)"
                address5 = "\(block5 )\(" ")\(city)"
                
                
                
                print(address1)
                
               
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


