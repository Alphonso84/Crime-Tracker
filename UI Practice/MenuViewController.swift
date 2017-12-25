//
//  MenuViewController.swift
//  Crime Tracker
//
//  Created by user on 11/30/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MenuViewController: UIViewController {
    
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    
    //Get Map Button
    @IBAction func getCrimeMap(_ sender: Any) {
       
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityLabel.text = city
        
        
        
    }



}
