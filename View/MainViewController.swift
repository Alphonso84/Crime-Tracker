//
//  ViewController.swift
//  UI Practice
//
//  Created by user on 11/6/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//
import MapKit
import CoreLocation
import UIKit
import Foundation

//USING GLOBAL VARIABLE SEEMS TO BE SIMPLEST SOLUTION
var city = String()
let manager = CLLocationManager()

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var SelectCityLabel: UILabel!
    @IBOutlet weak var switchWasFlipped: UIBarButtonItem!
    @IBOutlet weak var shadowImage: UIImageView!
    @IBOutlet weak var citySelection: UIPickerView?
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var AlamedaCountyCities = ["OAKLAND","FREMONT","HAYWARD","BERKELEY","SAN LEANDRO","LIVERMORE","PLEASANTON","ALAMEDA","UNION CITY","DUBLIN","NEWARK","EMERYVILLE","PIEDMONT"]
    
    @IBAction func `switch`(_ sender: UISwitch) {
        if (sender.isOn) {
            self.view.backgroundColor = UIColor.black
            citySelection?.tintColor = UIColor.black
            citySelection?.backgroundColor = UIColor.black
            SelectCityLabel.textColor = UIColor.white
            logoImage.image = #imageLiteral(resourceName: "Icon Dark")
            navigationController?.navigationBar.barTintColor = UIColor.black
            
        } else {
            logoImage.image = #imageLiteral(resourceName: "Icon")
            self.view.backgroundColor = UIColor.white
            citySelection?.tintColor = UIColor.white
            citySelection?.backgroundColor = UIColor.white
            SelectCityLabel.textColor = UIColor.black
            navigationController?.navigationBar.barTintColor = UIColor.white
        }
    }
    
    
    
    
    
    
    
    
    
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
    
    
    
    //  PICKERVIEW METHODS
    
    //NUMBER OF SECTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //NUMBER OF ROWS
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return AlamedaCountyCities.count
    }
    //TITLE OF SAID ROWS
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return AlamedaCountyCities[row]
    }
    //ASSIGN ROW VALUES TO GLOBAL VARIABLE CITY TO BE USED IN URL
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        city = AlamedaCountyCities[row]
    }
    
    
    
    //SETS VALUE IF USER DOESNT SELECT A CITY (DEFAULT)
    override func viewWillAppear(_ animated: Bool) {
        city = AlamedaCountyCities[0]
        
    }
    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        myMotionEffect(view: logoImage, min: -10, max: 10)
        myMotionEffect(view: shadowImage, min: 5, max: -5)
        
        manager.delegate = self as? CLLocationManagerDelegate
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        self.citySelection?.dataSource = self
        self.citySelection?.delegate = self
        
    }
    
    
    // GET DATA ACTION
    @IBAction func GetCrimeDataButton(_ sender: Any) {
        APIData().parseJSON()
        
        
    }
    
    func myMotionEffect(view: UIView, min: CGFloat, max: CGFloat) {
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        view.addMotionEffect(motionEffectGroup)
    }
}





