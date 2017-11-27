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
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func parseJSON() {
        var userCity = citySelection.text
        
        let url = URL(string:"https://data.acgov.org/resource/js8f-yfqf.json")
        var task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard error == nil else {
                print("returned error")
                return
            }
            if error != nil {
                
            }else{
                print("returned error")
            }
            
            guard let content = data else {
                print("No data")
                return
        }
            
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String:Any] else {
                print("not containing JSON")
                return
            }
    }
    
}
    
    
}

