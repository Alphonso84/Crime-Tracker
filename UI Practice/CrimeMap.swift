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


var StringResponse = String()
var coordinate = String() as Any

class CrimeMap: UIViewController {
    var CrimeLocationData:[MKMapItem] = []
   
    
    @IBOutlet weak var mapView: MKMapView!
    
    //Getting First Location
    func LocalSearch() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = address1
        print(address1)
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
               annotation.title = crimeDescription1
               annotation.subtitle = date1
                annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.mapView.addAnnotation(annotation)
                
                
                //Zooming In On Annotation
                let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let span = MKCoordinateSpanMake(0.50, 0.50)
                let region = MKCoordinateRegionMake(coordinates, span)
                self.mapView.setRegion(region, animated: true)
                
                
            }
        }
    }
    
    func LocalSearch2() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = address2
        print(address2)
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if response == nil {
                
                print("Error here")
            } else {
                //Remove Annotations
                let annotations = self.mapView.annotations
               // self.mapView.removeAnnotations(annotations)
                
                //Getting Data
                let latitude = response!.boundingRegion.center.latitude
                let longitude = response!.boundingRegion.center.longitude
                StringResponse = String(describing: response)
                
                
                //Create Annotations
                let annotation = MKPointAnnotation()
                annotation.title = crimeDescription2
                annotation.subtitle = date2
                annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.mapView.addAnnotation(annotation)
                
                
                //Zooming In On Annotation
                let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let span = MKCoordinateSpanMake(0.3, 0.3)
                let region = MKCoordinateRegionMake(coordinates, span)
                self.mapView.setRegion(region, animated: false)
                
                
            }
        }
    }
    func LocalSearch3() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = address3
        print(address3)
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if response == nil {
                
                print("Error here")
            } else {
                //Remove Annotations
                let annotations = self.mapView.annotations
                //self.mapView.removeAnnotations(annotations)
                
                //Getting Data
                let latitude = response!.boundingRegion.center.latitude
                let longitude = response!.boundingRegion.center.longitude
                StringResponse = String(describing: response)
                
                
                //Create Annotations
                let annotation = MKPointAnnotation()
                annotation.title = crimeDescription3
                annotation.subtitle = date3
                annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.mapView.addAnnotation(annotation)
                
                
                //Zooming In On Annotation
                let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let span = MKCoordinateSpanMake(0.2, 0.2)
                let region = MKCoordinateRegionMake(coordinates, span)
                self.mapView.setRegion(region, animated: false)
                
                
            }
        }
    }
    func LocalSearch4() {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = address4
        print(address4)
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            if response == nil {
                
                print("Error here")
            } else {
                //Remove Annotations
                let annotations = self.mapView.annotations
                //self.mapView.removeAnnotations(annotations)
                
                //Getting Data
                let latitude = response!.boundingRegion.center.latitude
                let longitude = response!.boundingRegion.center.longitude
                StringResponse = String(describing: response)
                
                
                //Create Annotations
                let annotation = MKPointAnnotation()
                annotation.title = crimeDescription4
                annotation.subtitle = date4
                annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                self.mapView.addAnnotation(annotation)
                
                
                //Zooming In On Annotation
                let coordinates:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                let span = MKCoordinateSpanMake(0.3, 0.3)
                let region = MKCoordinateRegionMake(coordinates, span)
                self.mapView.setRegion(region, animated: false)
                
                
            }
        }
    }




    override func viewDidLoad() {
        super.viewDidLoad()
        print(address1)
        LocalSearch()
        LocalSearch2()
        LocalSearch3()
        LocalSearch4()
       
       
    }
    
}


