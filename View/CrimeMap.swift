//
//  CrimeMap.swift
//  Crime Tracker
//
//  Created by user on 11/27/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//


import UIKit
import MapKit
import CoreGraphics


var annotations = [MKPointAnnotation]()
class CrimeMap: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LocalSearch()
       // annotations = [MKPointAnnotation(coordinatesArray)]
        
       
    }



//MAP ANNOTATION AND LOCATION METHOD
func LocalSearch() {


            //Remove Annotations
            let annotations = [MKAnnotation]()

            let latitude = 37.25666
            let longitude = -121.38749

            //Create Annotations
  
            let annotation = MKPointAnnotation()
            annotation.title = CrimeData[0].crimeDescription
            annotation.subtitle = CrimeData[0].date
    annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            self.mapView.addAnnotation(annotation)
    

            //Zooming In On Annotation
            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let span = MKCoordinateSpanMake(0.1, 0.1)
            let region = MKCoordinateRegionMake(coordinates, span)
            self.mapView.setRegion(region, animated: true)

        }

    }



