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
        
       // annotations = [MKPointAnnotation(coordinatesArray)]
        
       
    }
    
}

////MAP ANNOTATION AND LOCATION METHOD
//func LocalSearch() {
//
//    let address = "\(CrimeData[0].block ) \(CrimeData[0].city ) \(CrimeData[0].state)"
//    let request =  MKLocalSearchRequest()
//    request.naturalLanguageQuery = address
//    request.region = mapView.region
//    let search = MKLocalSearch(request: request)
//    search.start { response, error in
//        if response == nil {
//
//            print("Error here")
//        } else {
//            //Remove Annotations
//            let annotations = [MKPointAnnotation]()
//            self.mapView.removeAnnotations(annotations)
//
//            //Getting Data
//
//            let latitude = coordinatesArray[0][1]
//            let longitude = coordinatesArray[0][0]
//            //                    response!.boundingRegion.center.longitude
//            _ = String(describing: response)
//
//
//            //Create Annotations
//
//            let annotation = MKPointAnnotation()
//            annotation.title = CrimeData[0].crimeDescription
//            annotation.subtitle = CrimeData[0].date
//            annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
//            self.mapView.addAnnotation(annotation)
//
//
//
//            //Zooming In On Annotation
//            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
//            let span = MKCoordinateSpanMake(0.1, 0.1)
//            let region = MKCoordinateRegionMake(coordinates, span)
//            self.mapView.setRegion(region, animated: true)
//
//
//        }
//
//    }
//}


