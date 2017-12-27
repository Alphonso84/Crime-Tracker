//
//  ReportCrime.swift
//  Crime Tracker
//
//  Created by user on 11/27/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class ReportCrime: UIViewController {
    
    @IBOutlet weak var WebView: WKWebView!
    let URLForFremont = "https://www.fremontpolice.org/index.aspx?nid=89"
    let URLForOakland = "http://www2.oaklandnet.com/government/o/OPD/s/report-crime/index.htm"
    let URLForHayward = "https://www.hayward-ca.gov/police-department/public-services/file-police-report"
    let URLForBerkeley = "https://www.cityofberkeley.info/onlinereport/"
    let URLForSanLeandro = "http://ch-webext.sanleandro.org/coplogic/start-report.html"
    let URLForLivermore = "http://www.cityoflivermore.net/citygov/police/records_and_reporting/reporting/default.htm"
    let URLForPleasanton = "http://www.cityofpleasantonca.gov/gov/depts/police/community/reporting.asp"
    let URLForAlameda = "https://alamedaca.gov/police/file-online-police-report"
    let URLForUnionCity = "https://www.unioncity.org/270/File-a-Police-Report"
    let URLForDublin = "http://www.ci.dublin.ca.us/1335/File-a-Police-Report"
    let URLForNewark = "http://www.newark.org/departments/police/"
    let URLForEmeryville = "http://www.ci.emeryville.ca.us/123/Police"
    let URLForPiedmont = "http://www.ci.piedmont.ca.us/police/"
    
    var URLForCityArray = [String]()
    
    func URLforCitySelected() -> String {
        
    return ""
    }
    
    override func viewDidLoad() {
        URLForCityArray = [URLForOakland,URLForFremont,URLForHayward,URLForBerkeley,URLForSanLeandro,URLForLivermore,URLForPleasanton,URLForAlameda,URLForUnionCity,URLForDublin,URLForNewark,URLForEmeryville,URLForPiedmont]
        
        
        let url = URL(string:URLForFremont)
        WebView.load(URLRequest(url: url!))
    }
}
