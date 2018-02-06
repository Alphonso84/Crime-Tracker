//
//  ViewController.swift
//  UI Practice
//
//  Created by user on 11/6/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit
import Foundation

//USING GLOBAL VARIABLE SEEMS TO BE SIMPLEST SOLUTION
var city = String()

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var shadowImage: UIImageView!
    //LIST OF CITIES TO CHOOSE FROM
    @IBOutlet weak var backgroundImageView: UIImageView!
    var AlamedaCountyCities = ["OAKLAND","FREMONT","HAYWARD","BERKELEY","SAN LEANDRO","LIVERMORE","PLEASANTON","ALAMEDA","UNION CITY","DUBLIN","NEWARK","EMERYVILLE","PIEDMONT"]
    

   //PICKERVIEW TO CHOOSE CITIES
    @IBOutlet weak var citySelection: UIPickerView?
    
    
    
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
    
        
    


