// To parse the JSON, add this file to your project and do:
//
//

import Foundation

typealias CrimeReport = [PurpleCrimeReport]

struct CrimeReport: Decodable {
    let agencyid: String
    let block: String
    let city: String
    let crimecode: String
    let crimedescription: String
    let crimeid: String
    let datetime: String
    let state: String
    let zip: String?
    
    
    struct Location1 {
        let coordinates: [Double]
        let type: String
    }
}


// MARK: Top-level extensions -

extension Array where Element == CrimeReport {
    static func from(json: String, using encoding: String.Encoding = .utf8) -> [CrimeReport]? {
        guard let data = json.data(using: encoding) else { return nil }
   
        return from(data: data)
    }
    
    static func from(data: Data) -> [CrimeReport]? {
        let decoder = JSONDecoder()
        return try? decoder.decode([PurpleCrimeReport].self, from: data)
    }
    
    static func from(url urlString: String) -> [CrimeReport]? {
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
    
}

// MARK: Codable extensions -

extension CrimeReport {
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

extension Locatio {
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
