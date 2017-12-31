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
var county = String()
class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var Counties = ["CC COUNTY", "ALAMEDA COUNTY"]
    
    //LIST OF CITIES TO CHOOSE FROM
    var AlamedaCountyCities = ["OAKLAND","FREMONT","HAYWARD","BERKELEY","SAN LEANDRO","LIVERMORE","PLEASANTON","ALAMEDA","UNION CITY","DUBLIN","NEWARK","EMERYVILLE","PIEDMONT"]
    
    var ContraCostaCountyCities = ["CONCORD","WALNUT CREEK", "MARTINEZ","RICHMOND","ANTIOCH","PLEASANT HILL","SAN RAMON","DANVILLE","PITTSBURG","BRENTWOOD","LAFAYETTE","EL CERRITO","SAN PABLO","ORINDA","MORAGA","PINOLE","OAKLEY","CLAYTON","HERCULES","BLACKHAWK","NORTH RIMCHMOND"]

   //PICKERVIEW TO CHOOSE CITIES
    @IBOutlet weak var citySelection: UIPickerView?
    
    @IBOutlet weak var countySelection: UIPickerView?
  
    
    //  PICKERVIEW METHODS
    
        //NUMBER OF SECTIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
        //NUMBER OF ROWS
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return Counties.count
        } else {
            return AlamedaCountyCities.count
        }
        
    }
    
        //TITLE OF SAID ROWS
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return Counties[row]
        }
        if (countySelection?.selectedRow(inComponent: 0)) == 0  {
            return ContraCostaCountyCities[row]
        }else {
                return AlamedaCountyCities[row]
           }
    }
    
    
        //ASSIGN ROW VALUES TO GLOBAL VARIABLE CITY TO BE USED IN URL
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        if ((countySelection?.selectedRow(inComponent: 0)) == 0) {
            city = ContraCostaCountyCities[row]
             
        } else {
        city = AlamedaCountyCities[row]
           
    }
    }
    
    
    
    //SETS VALUE IF USER DOESNT SELECT A CITY (DEFAULT)
    override func viewWillAppear(_ animated: Bool) {
//        city = AlamedaCountyCities[0]
//         county = Counties[0]
    }
    
    
    //VIEW DID LOAD
    override func viewDidLoad() {
       
        super.viewDidLoad()
        self.countySelection?.delegate = self
        self.citySelection?.dataSource = self
        self.citySelection?.delegate = self
        //citySelection?.reloadAllComponents()
    }
    
// GET DATA ACTION
    @IBAction func GetCrimeDataButton(_ sender: Any) {
       APIData().parseJSON()
       APIData().CCparseJSON()
    }
}
    
        
    


