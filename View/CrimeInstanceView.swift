//
//  CrimeInstanceView.swift
//  Crime Tracker
//
//  Created by user on 12/25/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//


import UIKit

class CrimeInstanceView: UIViewController, UITableViewDelegate {
    
    //Outlets For View
    @IBOutlet weak var crimeDescriptionLabel: UILabel! 
    
    @IBOutlet weak var blockCityStateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
   
    
    //Variables that recieve data passed from CrimeList
    var stringForCrimeDescriptionLabel: String!
    var stringForblockCityStateLabel: String!
    var stringForDateLabel: String!
    
    @IBAction func SeeOnMapButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Value is Actually Assigned in CrimeList Controller in didSelectRow
        blockCityStateLabel.text = stringForblockCityStateLabel
        crimeDescriptionLabel.text = stringForCrimeDescriptionLabel
        dateLabel.text? = stringForDateLabel
    }

}
