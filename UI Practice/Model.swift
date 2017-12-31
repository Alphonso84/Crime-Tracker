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


//MODEL FOR CONTRACOSTA COUNTY
struct ContraCostaCrimeReport: Codable {
    let address1: String
    let caseNumber: String
    let city: String
    let clearanceType: String
    let createdAt: String
    let dayOfWeek: String
    let hourOfDay: String
    let incidentDatetime: String
    let incidentDescription: String
    let incidentID: String
    let incidentTypePrimary: String
    let latitude: String
    let location: Location
    let longitude: String
    let parentIncidentType: String
    let state: String
    let updatedAt: String
    let zip: String
    
    enum CodingKeys: String, CodingKey {
        case address1 = "address_1"
        case caseNumber = "case_number"
        case city = "city"
        case clearanceType = "clearance_type"
        case createdAt = "created_at"
        case dayOfWeek = "day_of_week"
        case hourOfDay = "hour_of_day"
        case incidentDatetime = "incident_datetime"
        case incidentDescription = "incident_description"
        case incidentID = "incident_id"
        case incidentTypePrimary = "incident_type_primary"
        case latitude = "latitude"
        case location = "location"
        case longitude = "longitude"
        case parentIncidentType = "parent_incident_type"
        case state = "state"
        case updatedAt = "updated_at"
        case zip = "zip"
    }
}

struct Location: Codable {
    let type: String
    let coordinates: [Double]
}


//MODEL FOR ALAMEDA COUNTY
struct AlamedaCrimeReport: Codable {
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


