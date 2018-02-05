//
//  CrimeStats.swift
//  Crime Tracker
//
//  Created by user on 2/5/18.
//  Copyright © 2018 Alphonso. All rights reserved.
//
import WebKit
import Foundation
import CoreLocation

class CrimeStats: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var WebView: WKWebView!
    
    @IBOutlet weak var ActivityView: UIActivityIndicatorView!
    
    @IBOutlet weak var CityLabel: UILabel!
   
    
    
    
    var mylocation = ""
    
    let URLForOakland = "https://www.neighborhoodscout.com/ca/oakland/crime"
    let URLForFremont = "https://www.neighborhoodscout.com/ca/fremont/crime"
    let URLForHayward = "https://www.neighborhoodscout.com/ca/hayward/crime"
    let URLForBerkeley = "https://www.neighborhoodscout.com/ca/berkeley/crime"
    let URLForSanLeandro = "https://www.neighborhoodscout.com/ca/san-leandro/crime"
    let URLForLivermore = "https://www.neighborhoodscout.com/ca/livermore/crime"
    let URLForPleasanton = "https://www.neighborhoodscout.com/ca/pleasanton/crime"
    let URLForAlameda = "https://www.neighborhoodscout.com/ca/alameda/crime"
    let URLForUnionCity = "https://www.neighborhoodscout.com/ca/union-city/crime"
    let URLForDublin = "https://www.neighborhoodscout.com/ca/dublin/crime"
    let URLForNewark = "https://www.neighborhoodscout.com/ca/newark/crime"
    let URLForEmeryville = "https://www.neighborhoodscout.com/ca/emeryville/crime"
    let URLForPiedmont = "https://www.neighborhoodscout.com/ca/piedmont/crime"
     var url: URL!
    
    override func viewDidLoad() {
        CityLabel.text = city
        WebView.navigationDelegate = self
        
        //SWITCH STATEMENT CONTROLS WHICH WEBSITE LOADS DEPENDING ON CITY SELECTED IN PICKER IN (MAINVIEWCONTROLLER)
        switch city {
        case "OAKLAND":
            url = URL(string: URLForOakland)
        case "FREMONT":
            url = URL(string: URLForFremont)
        case "HAYWARD":
            url = URL(string: URLForHayward)
        case "BERKELEY":
            url = URL(string: URLForBerkeley)
        case "SAN LEANDRO":
            url = URL(string: URLForSanLeandro)
        case "LIVERMORE":
            url = URL(string: URLForLivermore)
        case "PLEASANTON":
            url = URL(string: URLForPleasanton)
        case "ALAMEDA":
            url = URL(string: URLForAlameda)
        case "UNION CITY":
            url = URL(string: URLForUnionCity)
        case "DUBLIN":
            url = URL(string: URLForDublin)
        case "NEWARK":
            url = URL(string: URLForNewark)
        case "EMERYVILLE":
            url = URL(string: URLForEmeryville)
        case "PIEDMONT":
            url = URL(string: URLForPiedmont)
        default:
            url = URL(string: URLForOakland)
        }
        
        WebView.load(URLRequest(url:url))
        
        }
    
    
    func WebView(_ webView: WKWebView,didStart navigation: WKNavigation!) {
        print("Start Page Loading")
        ActivityView.startAnimating()
    }

    func webView(_ webView: WKWebView,didFinish navigation: WKNavigation!) {
        print("Page loaded")
        ActivityView.stopAnimating()
    }
    
}
