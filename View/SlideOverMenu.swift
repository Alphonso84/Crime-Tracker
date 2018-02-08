//
//  SlideOverMenu.swift
//  Crime Tracker
//
//  Created by user on 2/5/18.
//  Copyright © 2018 Alphonso. All rights reserved.
//

import Foundation
import UIKit

class SlideOverMenu: UIViewController {
    @IBAction func userDidTap(_sender: Any) {
        self.dismiss(animated: true)
        
        }
   
    @IBAction func getLocationCrimes(_ sender: Any) {
        APIData().parseJSONLocation()
    }
    
    
}
