//
//  ViewController.swift
//  UI Practice
//
//  Created by user on 11/6/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit
import Foundation



class ViewController: UIViewController {
    
    @IBOutlet weak var citySelection: UITextField!
    var tableArray = [String] ()
   

    override func viewDidLoad() {
        
        parseJSON()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func GetCrimeDataButton(_ sender: Any) {
        
    }
    
    typealias JSON = [String : String]
    
    func parseJSON() {
        var userCity = citySelection.text
        let urlString = "https://data.acgov.org/resource/js8f-yfqf.json"
        let url = URL(string: urlString)
        
        
        let unwrappedURL = url
        
        let session = URLSession.shared
        let task = session.dataTask(with: unwrappedURL!) { (data, response, error) in
            print("Start")
            guard let unwrappedData = data else {return}
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                print("Got Data")
                print(responseJSON)
                
            } catch {
                print(error)
            }
        }
        task.resume()
        }
    
}
    
    


