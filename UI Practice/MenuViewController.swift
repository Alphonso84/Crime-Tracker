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
var address = String()
class MenuViewController: UIViewController {
    lazy var geocoder = CLGeocoder()
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBAction func getCrimeMap(_ sender: Any) {
       
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
cityLabel.text = city
        
        
        // Do any additional setup after loading the view.
    }



}
