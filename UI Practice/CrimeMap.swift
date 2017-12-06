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


var coordinate = CLLocationCoordinate2D()

class CrimeMap: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 10000
    
   
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        
        
        
    }
    
}


