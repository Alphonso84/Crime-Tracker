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
//EMPTY STRING BUILT FROM USERS LOCATION
var locationURLString = ""
//ARRAY OF MODEL TYPE CRIMEREPORT
var CrimeData = [CrimeReport]()

var Locations = [CLLocationCoordinate2D]()

var latitude = [Double]()
var longitude = [Double]()
var crimeString = [String]()


var coordinatesArray = [[Double]]()
var crimeTitle = [String?]()
var crimeDate = [String?]()
var crimeBlock = [String?]()


class APIData {
   
  
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    private let secretToken = "CcZhJkCwYWL4i6tAzfDw81u-MD4lGOYSJGen"
    
    //METHOD FOR BUILDING API URL
   public func buildUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=50"
        //URL FILTER ORDERS BY MOST RECENT
        let sortOrder = "&$order=datetime DESC"
        //URL FILTER ORDERS RESULTS BY CITY(GLOBAL VARIABLE SET IN MAINVIEWCONTROLLER)
        let userCity = "&city=\(city)"
    

        urlString = "\(baseURL)\(token)\(userCity)\(sortOrder)\(numberOfResults)"
    
        let FormattedUrlString = urlString.replacingOccurrences(of: " ", with: "%20")
        let url = URL(string: FormattedUrlString)
    
        return url!
        
    }
    public func buildLocationUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=50"
        //URL FILTER ORDERS BY MOST RECENT
        let sortOrder = "&$order=datetime DESC"
        //URL FILTER ORDERS RESULTS BY CITY(GLOBAL VARIABLE SET IN MAINVIEWCONTROLLER)
        let userCity = "&city=\(city)"
        
        let locationQuery = "$where=within_circle(location_1, \(latitude[0]), \(longitude[0]), 8000)"
        // print(MainViewController.CityString().city)
        
        urlString = "\(baseURL)\(token)\(userCity)\(sortOrder)\(numberOfResults)"
        locationURLString = "\(baseURL)?\(locationQuery)\(sortOrder)\(numberOfResults)"
        print(locationURLString)
        let FormattedUrlString = locationURLString.replacingOccurrences(of: " ", with: "%20")
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
            print(urlString)
            guard let unwrappedData = data else {return}
            do {
              
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(Array<CrimeReport>.self, from: unwrappedData)
                //USE SERILIZATION BELOW IF DECODER DOESNT WORK
                //JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                
                //CRIMEDATA IS AN ARRAY OF STRUCT TYPE CRIMEREPORT
                CrimeData = jsonData
                
               
                //PRINT OUT ANY DATA COMBINATION HERE
                
                
                
                
                } catch {
                print(error)
                }
            }
        task.resume()
    }
    func parseJSONLocation() {
        let unwrappedURL = self.buildLocationUrl(constructedUrl: locationURLString)
        //URL SESSION
        let session = URLSession.shared
        let task = session.dataTask(with: (unwrappedURL)) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            do {
                
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode(Array<CrimeReport>.self, from: unwrappedData)
                //USE SERILIZATION BELOW IF DECODER DOESNT WORK
                //JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [[String:Any]]
                
                //CRIMEDATA IS AN ARRAY OF STRUCT TYPE CRIMEREPORT
                CrimeData = jsonData
                
                //USING MAP METHOD TO TRANSFORM CRIMEDATA ARRAY INTO ARRAY OF GLOBAL VARIABLES
                coordinatesArray = CrimeData.map {$0.location1.coordinates}
                crimeTitle = CrimeData.map {$0.crimeDescription}
                crimeDate = CrimeData.map {$0.date}
                crimeBlock = CrimeData.map {$0.date}
                
                //PRINT OUT ANY DATA COMBINATION HERE
                
                print("Hello")
               
                print(CrimeData)

                
            } catch {
                print(error)
            }
        }
        task.resume()
        
    }
    
}
    


