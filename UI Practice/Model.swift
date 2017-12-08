//
//  Model.swift
//  Crime Tracker
//
//  Created by user on 12/7/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import Foundation

struct CrimeReport: Decodable {
    var crimeBlock = String() ?? "block"
    var crimeDate = String() ?? "datetime"
    var crimeDescription = String() ?? "crimedescription"
    var crimeCity = String() ?? "crimeCity"
    var crimeState = String() ?? "state"
}


