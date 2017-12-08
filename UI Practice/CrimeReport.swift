//
//  CrimeReport.swift
//  Crime Tracker
//
//  Created by user on 12/7/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//
// To parse the JSON, add this file to your project and do:
//
//   let crimeReport = CrimeReport.from(json: jsonString)!

import Foundation
import UIKit

var info = "Testing"
//API TOKEN
private let token = "?$$app_token=BEyC2oP4D1T8CaKegklvf4ExN"

//METHOD FOR BUILDING API URL
func buildUrl(constructedUrl: String) -> URL{
    let baseURL = "https://data.acgov.org/resource/js8f-yfqf.json"
    //URL FILTER LIMITS RESULTS RETURNED
    let numberOfResults = "&$limit=30"
    //URL FILTER ORDERS BY MOST RECENT
    let sortOrder = "&$order=datetime DESC"
    //URL FILTER ORDERS RESULTS BY CITY(GLOBAL VARIABLE)
    let userCity = "&city=\(city)"
    // print(MainViewController.CityString().city)
    
    urlString = "\(baseURL)\(token)\(userCity)\(sortOrder)\(numberOfResults)"
    let FormattedUrlString = urlString.replacingOccurrences(of: " ", with: "%20")
    let url = URL(string: FormattedUrlString)
    return url!
    
    
}

typealias CrimeReport = [PurpleCrimeReport]

struct PurpleCrimeReport: Codable {
    let agencyid: String
    let block: String
    let city: String
    let crimecode: String
    let crimedescription: String
    let crimeid: String
    let datetime: String
    let location1: Location1
    let state: String
    let zip: String?
}

struct Location1: Codable {
    let coordinates: [Double]
    let type: String
}

// MARK: Top-level extensions -

extension Array where Element == PurpleCrimeReport {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> [PurpleCrimeReport]? {
        guard let data = json.data(using: encoding) else { return nil }
        return from(data: data)
    }
    
    static func from(data: Data) -> [PurpleCrimeReport]? {
        let decoder = JSONDecoder()
        return try? decoder.decode([PurpleCrimeReport].self, from: data)
    }
    
    static func from(url urlString: String) -> [PurpleCrimeReport]? {
        guard let url = URL(string: urlString) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        return from(data: data)
    }
    
    var jsonData: Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
    
    var jsonString: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
    let crimeReport = CrimeReport.from(json: jsonString)!
}

// MARK: Codable extensions -

extension PurpleCrimeReport {
    enum CodingKeys: String, CodingKey {
        case agencyid = "agencyid"
        case block = "block"
        case city = "city"
        case crimecode = "crimecode"
        case crimedescription = "crimedescription"
        case crimeid = "crimeid"
        case datetime = "datetime"
        case location1 = "location_1"
        case state = "state"
        case zip = "zip"
    }
}

extension Location1 {
    enum CodingKeys: String, CodingKey {
        case coordinates = "coordinates"
        case type = "type"
    }
}

// Helpers

class JSONNull: Codable {
    public init() {
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

