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
    var switchChanged = false
    
    var AlamedaCountyCities = ["OAKLAND","FREMONT","HAYWARD","BERKELEY","SAN LEANDRO","LIVERMORE","PLEASANTON","ALAMEDA","UNION CITY","DUBLIN","NEWARK","EMERYVILLE","PIEDMONT"]
    
    @IBAction func `switch`(_ sender: UISwitch) {
        switchChanged = !switchChanged
        setNeedsStatusBarAppearanceUpdate()
        if (sender.isOn) {
            
            
            UIView.animate(withDuration: 0.5, animations: {
                self.navigationController?.navigationBar.barTintColor = UIColor.black
                self.navigationItem.titleView?.setValue(UIColor.white, forKey: "tintColor")
                
                
            })
            
            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor.black
                
                self.citySelection?.setValue(UIColor.white, forKey: "textColor")
                self.citySelection?.backgroundColor = UIColor.black
                self.SelectCityLabel.textColor = UIColor.white
                self.logoImage.image = #imageLiteral(resourceName: "Icon Dark")
                
            })
            
        } else {
            
            UIView.animate(withDuration: 0.5, animations: {
                self.setupView()
            })
        }
    }
    override func setNeedsStatusBarAppearanceUpdate() {
        var preferredStatusBarStyle: UIStatusBarStyle{
            return .default
        }
        if switchChanged == true {
            var preferredStatusBarStyle: UIStatusBarStyle{
                return .default
            }
        }
    }
    
    
    func setupView() {
        self.logoImage.image = #imageLiteral(resourceName: "Icon")
        self.view.backgroundColor = UIColor.white
        self.citySelection?.setValue(UIColor.black, forKey: "textColor")
        self.citySelection?.backgroundColor = UIColor.white
        self.SelectCityLabel.textColor = UIColor.black
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationItem.titleView?.largeContentTitle = "Crime Tracker"
        self.navigationItem.titleView?.setValue(UIColor.black, forKey: "tintColor")
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
    
    
    @IBOutlet weak var switchValue: UIBarButtonItem!
    
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
        setupView()
    }
    
    //VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myMotionEffect(view: logoImage, min: -10, max: 10)
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





