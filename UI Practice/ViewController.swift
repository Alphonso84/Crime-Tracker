//
//  ViewController.swift
//  UI Practice
//
//  Created by user on 11/6/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit
import Foundation




class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //LIST OF CITIES TO CHOOSE FROM
    var AlamedaCountyCities = ["OAKLAND","FREMONT","HAYWARD","BERKELEY","SAN LEANDRO","LIVERMORE","PLEASANTON","ALAMEDA","UNION CITY","DUBLIN","NEWARK","ALBANY","EMERYVILLE","PIEDMONT"]

   //PICKERVIEW TO CHOOSE CITIES
    @IBOutlet weak var citySelection: UIPickerView?
    var city: String = ""
    
    //MARK: PICKERVIEW METHODS
    
        //NUMBER OF SECTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        //NUMBER OF ROWS
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AlamedaCountyCities.count
    }
        //TITLE OF SAID ROWS
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return AlamedaCountyCities[row]
    }
        //ASSIGN ROW VALUES TO CITY VARIABLE TO BE USED IN URL
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        city = AlamedaCountyCities[row]
        }

    
//VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.citySelection?.dataSource = self
        self.citySelection?.delegate = self
        
    }
    
    // GET DATA ACTION
    @IBAction func GetCrimeDataButton(_ sender: Any) {
        parseJSON()
    }
    
    //RETRIEVE DATA METHOD
    func parseJSON() {
        
        let userCity = "?city=\(city)"
        
        let urlString = "https://data.acgov.org/resource/js8f-yfqf.json\(userCity)"
        let url = URL(string: urlString)
        
        
        let unwrappedURL = url
        
        let session = URLSession.shared
        let task = session.dataTask(with: unwrappedURL!) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: .allowFragments)
               
                print("Got Data")
                print(responseJSON)
                
                
            } catch {
                print(error)
            }
            
        }
        task.resume()
        }
    
}
    
    


