//
//  Model.swift
//  Crime Tracker
//
//  Created by user on 12/24/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//MODEL BASED ON RETURNED JSON DATA
struct CrimeReport: Codable {
    var block: String
    var crimeDescription: String
    var city: String
    var location1 : Location1
    var date: String
    var state: String
    
    enum CodingKeys: String, CodingKey {
        case block = "block"
        case crimeDescription = "crimedescription"
        case city = "city"
        case date = "datetime"
        case state = "state"
        case location1 = "location_1"
    }
}
struct Location1: Codable {
    let type: String
    let coordinates: [Double]
}


