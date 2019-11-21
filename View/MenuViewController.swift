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

class MenuViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SETS LABEL AT TOP OF MENUVIEW CONTROLLER
        cityLabel.text = city
        cityLabel.textColor = UIColor.label
        //SETS MENU VIEW BACKGROUND IMAGE TO IMAGE OF SELECTED CITY
        self.view.backgroundColor = UIColor.systemBackground
    }
    
   
    
}
