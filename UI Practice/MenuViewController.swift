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
        address = "\(crimeBlock as! String),\(crimeCity as! String),\(crimeState as! String)"
        print(address)
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            //self.processResponse(withPlacemarks: placemarks, error: error)
    }
    }
    
//        func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
//            // Update View
//
//
//            if let error = error {
//                print("Unable to Forward Geocode Address (\(error))")
//                print("Unable to Find Location for Address")
//
//            } else {
//                var location: CLLocation?
//
//                if let placemarks = placemarks, placemarks.count > 0 {
//                    location = placemarks.first?.location
//                }
////                location.coordinate
//                if let location = location {
//                    //let crimePoint = ((coordinate.latitude, coordinate.longitude))
//
//                } else {
//                    print("No Matching Location Found")
//                }
//            }
//        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
cityLabel.text = city
        
        
        // Do any additional setup after loading the view.
    }



}
