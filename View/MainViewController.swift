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
    
    //LIST OF CITIES TO CHOOSE FROM
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
        
        self.citySelection?.dataSource = self
        self.citySelection?.delegate = self
       
    }
    
// GET DATA ACTION
    @IBAction func GetCrimeDataButton(_ sender: Any) {
       APIData().parseJSON()
       
    }
}
    
        
    


