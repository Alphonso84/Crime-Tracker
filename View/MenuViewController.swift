//
//  MenuViewController.swift
//  Crime Tracker
//
//  Created by user on 11/30/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
var CityBackGrounds = [#imageLiteral(resourceName: "OAKLAND"),#imageLiteral(resourceName: "FREMONT"),#imageLiteral(resourceName: "HAYWARD"),#imageLiteral(resourceName: "BERKELEY"),#imageLiteral(resourceName: "LIVERMORE"),#imageLiteral(resourceName: "ALAMEDA"),#imageLiteral(resourceName: "UNION CITY"),#imageLiteral(resourceName: "NEWARK"),#imageLiteral(resourceName: "EMERYVILLE"),#imageLiteral(resourceName: "PIEDMONT")]
class MenuViewController: UIViewController {
    
    
    @IBOutlet weak var cityBackGroundImage: UIImageView!
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SETS LABEL AT TOP OF MENUVIEW CONTROLLER
        cityLabel.text = city
        //SETS MENU VIEW BACKGROUND IMAGE TO IMAGE OF SELECTED CITY
        cityBackGroundImage.image = UIImage(named: city)
        
    }
    
   
    
}
