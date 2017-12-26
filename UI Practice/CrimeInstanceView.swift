//
//  CrimeInstanceView.swift
//  Crime Tracker
//
//  Created by user on 12/25/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//


import UIKit

class CrimeInstanceView: UIViewController, UITableViewDelegate {
    
    
    @IBOutlet weak var crimeDescriptionLabel: UILabel! 
    
    @IBOutlet weak var blockCityStateLabel: UILabel!
    
    @IBOutlet weak var crimeInstanceImage: UIImageView!
    
    var stringForCrimeDescriptionLabel: String!
    var stringForblockCityStateLabel: String!
    var photoForCrimeInstanceImage: UIImage!
    
    @IBAction func SeeOnMapButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        
        crimeInstanceImage.image = photoForCrimeInstanceImage
        blockCityStateLabel.text = stringForblockCityStateLabel
        crimeDescriptionLabel.text = stringForCrimeDescriptionLabel
        
    }

}
