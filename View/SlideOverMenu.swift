//
//  SlideOverMenu.swift
//  Crime Tracker
//
//  Created by user on 2/5/18.
//  Copyright © 2018 Alphonso. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit


class SlideOverMenu: UIViewController {
    @IBAction func userDidTap(_sender: Any) {
        self.dismiss(animated: true)
        
        }
    override func viewDidLoad() {
        latitude = [manager.location!.coordinate.latitude]
        longitude = [manager.location!.coordinate.longitude]
    }
   
    @IBAction func getLocationCrimes(_ sender: Any) {
  APIData().parseJSONLocation()
       
    }
    
    
}
