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

    override func viewWillAppear(_ animated: Bool) {
        latitude = [manager.location!.coordinate.latitude]
        longitude = [manager.location!.coordinate.longitude]
    }
    override func viewDidLoad() {
        latitude = [manager.location!.coordinate.latitude]
        longitude = [manager.location!.coordinate.longitude]
        
        let DataAlert = UIAlertController(title: "ATTENTION", message: "Crime data retrieved outside of Alameda County, CA may be out of date or unavailable", preferredStyle: UIAlertControllerStyle.alert)
        DataAlert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
        APIData().parseJSONLocation()
        present(DataAlert, animated: true, completion: nil)
    }
    
    @IBAction func getLocationCrimes(_ sender: Any) {
        //APIData().parseJSONLocation()
        
    }
    
    
}
