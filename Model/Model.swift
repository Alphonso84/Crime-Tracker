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
struct CrimeReport: Decodable {
    var block: String
    var crimeDescription: String
    var city: String
    var location1 : Location1
    var date: String
    var state: String
    
    enum CodingKeys: String, CodingKey {
        case block = "block"
        case city = "city"
        case crimeDescription = "crimedescription"
        case date = "datetime"
        case state = "state"
        case location1 = "location_1"
    }
}

let AlamedaCountyCities = ["OAKLAND","FREMONT","HAYWARD","BERKELEY","SAN LEANDRO","LIVERMORE","PLEASANTON","ALAMEDA","UNION CITY","DUBLIN","NEWARK","EMERYVILLE","PIEDMONT"]

struct Location1: Decodable {
    let type: String
    let coordinates: [Double]
}

//public struct Safe<Base: Decodable>: Decodable {
//    public let value: Base?
//    
//    public init(from decoder: Decoder) throws {
//        do {
//            let container = try decoder.singleValueContainer()
//            self.value = try container.decode(Base.self)
//        } catch {
//            assertionFailure("ERROR: \(error)")
//            // TODO: automatically send a report about a corrupted data
//            self.value = nil
//        }
//    }
//}





