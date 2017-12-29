//
//  APIData.swift
//  Crime Tracker
//
//  Created by user on 11/30/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//
import MapKit
import UIKit

//EMPTY STRING FOR URL
var urlString = ""

//ARRAY OF MODEL TYPE CRIMEREPORT
var CrimeData = [CrimeReport]()

var coordinatesArray = [Double]()
var crimeTitle = [String]()
class APIData {
   
  
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    
    //METHOD FOR BUILDING API URL
   public func buildUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=50"
        //URL FILTER ORDERS BY MOST RECENT
        let sortOrder = "&$order=datetime DESC"
        //URL FILTER ORDERS RESULTS BY CITY(GLOBAL VARIABLE SET IN MAINVIEWCONTROLLER)
        let userCity = "&city=\(city)"
       // print(MainViewController.CityString().city)
        
        urlString = "\(baseURL)\(token)\(userCity)\(sortOrder)\(numberOfResults)"
       
        let FormattedUrlString = urlString.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: FormattedUrlString)
    
        return url!
        
    }
    
  func viewDidLoad() {
    
        
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
                
                //USING MAP METHOD TO TRANSFORM CRIMEDATA ARRAY INTO ARRAY OF COORDINATES FOR USE IN CRIME MAP
                coordinatesArray = CrimeData.map {$0.location1.coordinates[0]}
                crimeTitle = CrimeData.map {$0.crimeDescription}
                //PRINTING OUT ANY DATA COMBINATION HERE
                print(coordinatesArray)
                //print(coordinatesArray[0][1])
                
                } catch {
                print(error)
                }
            }
        task.resume()
        
    }
    
    
    
}
    


