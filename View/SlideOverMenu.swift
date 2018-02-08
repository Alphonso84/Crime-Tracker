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
let manager = CLLocationManager()


let myLocation = CLLocationCoordinate2D()
public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) ->CLLocationCoordinate2D {
    let location = locations[0]
    let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    
    
    return myLocation
}

func returnUserLocation() -> CLLocationCoordinate2D {
    let userLocation = manager.location!.coordinate
    return userLocation
}

class SlideOverMenu: UIViewController {
    @IBAction func userDidTap(_sender: Any) {
        self.dismiss(animated: true)
        
        }
   
    @IBAction func getLocationCrimes(_ sender: Any) {
        manager.delegate = self as? CLLocationManagerDelegate
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        latitude = [manager.location!.coordinate.latitude]
        longitude = [manager.location!.coordinate.longitude]
        APIData().parseJSONLocation()
    }
    
    
}
