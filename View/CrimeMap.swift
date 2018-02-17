//
//  CrimeMap.swift
//  Crime Tracker
//
//  Created by user on 11/27/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation
import CoreGraphics

var userLocation = CLLocationCoordinate2D()
var stringCrime = String()
var dateCrime = String()
var lat = Double()
var long = Double()
var annotations = [MKPointAnnotation]()
extension CLLocationCoordinate2D {
    //distance in meters, as explained in CLLoactionDistance definition
    func distance(from: CLLocationCoordinate2D) -> CLLocationDistance {
        let destination = CLLocation(latitude:from.latitude,longitude:from.longitude)
        return CLLocation(latitude: latitude, longitude: longitude).distance(from: destination)
    }
}



class CrimeMap: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    let myLocation = CLLocationCoordinate2D()
   public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) ->CLLocationCoordinate2D? {
        let location = locations[0]
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)

        self.mapView.showsUserLocation = true
    
        return myLocation
    }
    
    func returnUserLocation() -> CLLocationCoordinate2D {
        let userLocation = manager.location!.coordinate
        
        return userLocation
    }
    let locations = CLLocationCoordinate2DMake(lat , long)
    // let crimeLocations = CLLocationCoordinate2DMake(
    
    override func viewWillAppear(_ animated: Bool) {
      
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
//        print(returnUserLocation())
//        print(manager.location!.coordinate)
//        print(locations)
//        print(manager.location!.coordinate.distance(from: locations))
        
        //Creating Alert to inform user of how far away crime is from thier location
        let locationAlert = UIAlertController(title: "\(stringCrime)", message: "This crime happend \(manager.location!.coordinate.distance(from: locations) * 3.3/5280) miles from your location", preferredStyle: UIAlertControllerStyle.alert)
        locationAlert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil))
        //Alert will only display if crime is less than 8000 meters from users location.
        if manager.location!.coordinate.distance(from: locations) < 8000 {
            present(locationAlert, animated: true, completion: nil)
        }
      mapView.setRegion(MKCoordinateRegionMakeWithDistance(locations, 2000, 2000), animated: true)
      let crimes = PinAnnotation(title: "\(stringCrime)", subtitle: "\(dateCrime)", coordinate: locations)
        
        mapView.addAnnotation(crimes)
    }


}


