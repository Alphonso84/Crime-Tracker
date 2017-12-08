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


class APIData: MainViewController {
   
    var info = "Testing"
    //API TOKEN
    private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"
    
    //METHOD FOR BUILDING API URL
    func buildUrl(constructedUrl: String) -> URL{
        let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
        //URL FILTER LIMITS RESULTS RETURNED
        let numberOfResults = "&$limit=30"
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
        print(urlString)
        let unwrappedURL = buildUrl(constructedUrl: urlString)
        //URL SESSION
        let session = URLSession.shared
        let task = session.dataTask(with: (unwrappedURL)) { (data, response, error) in
            print("Start")
            print(unwrappedURL)
            guard let data = data else {return}
            do {
                let crimeData = try JSONDecoder().decode([CrimeReport].self, from: data)
                print()
            } catch {
                print(error)
                
            }
            
        }
        task.resume()
        
    }
    
    
    
}
    


