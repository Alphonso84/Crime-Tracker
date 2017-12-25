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

var address = String()
var StringResponse = String()
var coordinate = String() as Any

class CrimeMap: UIViewController {
    //var CrimeLocationData:[MKMapItem] = []
    var AnnotationArray: [MKPointAnnotation] = []
    
    @IBOutlet weak var mapView: MKMapView!
    

    func LocalSearch() {
        
        address = "\(CrimeData[0].block ) \(CrimeData[0].city ) \(CrimeData[0].state)"
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = address
        //print(address)
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if response == nil {
                
                print("Error here")
            } else {
                //Remove Annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                //Getting Data
                let latitude = response!.boundingRegion.center.latitude
                let longitude = response!.boundingRegion.center.longitude
                StringResponse = String(describing: response)
                
                
                //Create Annotations
                let annotation = MKPointAnnotation()
                annotation.title = CrimeData[0].crimeDescription
               annotation.subtitle = CrimeData[0].date
                annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.AnnotationArray.append(annotation)
                self.mapView.addAnnotation(annotation)
                
                let annotation1 = MKPointAnnotation()
                annotation1.title = CrimeData[1].crimeDescription
                annotation1.subtitle = CrimeData[1].date
                annotation1.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.AnnotationArray.append(annotation1)
                self.mapView.addAnnotation(annotation1)
                
                let annotation2 = MKPointAnnotation()
                annotation2.title = CrimeData[2].crimeDescription
                annotation2.subtitle = CrimeData[2].date
                annotation2.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.AnnotationArray.append(annotation2)
                self.mapView.addAnnotation(annotation2)
                
                
                //Zooming In On Annotation
                let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let span = MKCoordinateSpanMake(0.1, 0.1)
                let region = MKCoordinateRegionMake(coordinates, span)
                self.mapView.setRegion(region, animated: true)
                
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //print(address)
        LocalSearch()
        
       
       
    }
    
}


