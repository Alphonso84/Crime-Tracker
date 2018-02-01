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
import CoreGraphics


var stringCrime = String()
var dateCrime = String()
var lat = Double()
var long = Double()
var annotations = [MKPointAnnotation]()


class CrimeMap: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    
    let locations = CLLocationCoordinate2DMake(lat , long)
    // let crimeLocations = CLLocationCoordinate2DMake(
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      mapView.setRegion(MKCoordinateRegionMakeWithDistance(locations, 2000, 2000), animated: true)
let crimes = PinAnnotation(title: "\(stringCrime)", subtitle: "\(dateCrime)", coordinate: locations)
        
        mapView.addAnnotation(crimes)
    }


}


