//
//  CrimeTableViewself.swift
//  Crime Tracker
//
//  Created by Alphonso Sensley II on 11/24/19.
//  Copyright © 2019 Alphonso. All rights reserved.
//

import Foundation
import UIKit


protocol CrimeTableViewCellDelegate {
    
    func configCellimage(cellLabel:String)->UIImage
    
}

class CrimeTableViewCell : UITableViewCell {
    
    var delegate: CrimeTableViewCellDelegate?
    var crimeLabel =  UILabel()
    
    func configureCell(indexPath:IndexPath) {
        let descript = CrimeData[indexPath.row].crimeDescription
           self.textLabel?.font = UIFont(name: "Menlo", size: 15.00)
           self.textLabel?.text = descript
        
       }
    
    func configureCellImage(indexPath:IndexPath) {
        let description = CrimeData[indexPath.row].crimeDescription
        
        //THERE HAS TO BE A BETTER WAY TO IMPLEMENT THIS LOGIC //ALREADY TRIED SWITCH//IF/ELSE
        (description.contains("EOD")) ? (self.imageView?.image = #imageLiteral(resourceName: "explosive")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("RECKLESS")) ? (self.imageView?.image = #imageLiteral(resourceName: "Reckless")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("SUSPICIOUS")) ? (self.imageView?.image = #imageLiteral(resourceName: "Suspicious")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("ARREST")) ? (self.imageView?.image = UIImage(named: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("STOLEN AUTO")) ? (self.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("TAKE VEHICLE")) ? (self.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("TRAFFIC COLLISION")) ? (self.imageView?.image = #imageLiteral(resourceName: "Collision")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("STOLEN VEHICLE")) ? (self.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("DUI")) ? (self.imageView?.image = #imageLiteral(resourceName: "DUI")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("CONTROLLED SUBSTANCE")) ? (self.imageView?.image = #imageLiteral(resourceName: "drugs")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("BURGLARY")) ? (self.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("THEFT")) ? (self.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("OUTSIDE AGENCY ASSIST")) ? (self.imageView?.image = #imageLiteral(resourceName: "AGENCY ASSIST")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("INCIDENT REPORT")) ? (self.imageView?.image = #imageLiteral(resourceName: "incident report")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("REPORT")) ? (self.imageView?.image = #imageLiteral(resourceName: "incident report")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("VANDALISM")) ? (self.imageView?.image = #imageLiteral(resourceName: "vandalism")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("ROBBERY")) ? (self.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("UNLICENSED")) ? (self.imageView?.image = #imageLiteral(resourceName: "unlicensed")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("EVADE")) ? (self.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("EVADING")) ? (self.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("WARRANT")) ? (self.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("WEAPON")) ? (self.imageView?.image = #imageLiteral(resourceName: "weapons")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("GUN")) ? (self.imageView?.image = #imageLiteral(resourceName: "weapons")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("MURDER")) ? (self.imageView?.image = #imageLiteral(resourceName: "murder")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("BATTERY")) ? (self.imageView?.image = #imageLiteral(resourceName: "Battery")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("DISTURB BY LOUD")) ? (self.imageView?.image = #imageLiteral(resourceName: "disturbance")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("MENTAL HEALTH")) ? (self.imageView?.image = #imageLiteral(resourceName: "Mental Health")) : (((self.imageView?.image = nil) != nil)) && (description.contains("SPEED")) ? (self.imageView?.image = #imageLiteral(resourceName: "Speeding")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("TOW")) ? (self.imageView?.image = #imageLiteral(resourceName: "Tow")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("INJURY")) ? (self.imageView?.image = #imageLiteral(resourceName: "injury")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("FIREARM")) ? (self.imageView?.image = #imageLiteral(resourceName: "FIreArm")) : (((self.imageView?.image = nil) != nil)) && (description.contains("SHOOT")) ? (self.imageView?.image = #imageLiteral(resourceName: "Shooting")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("COURT")) ? (self.imageView?.image = #imageLiteral(resourceName: "Court")) : (((self.imageView?.image = nil) != nil))
            //                && (description.contains("VEHICLE ACCIDENT")) ? (self.imageView?.image = #imageLiteral(resourceName: "Collision")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("ATTACKING ANIMAL")) ? (self.imageView?.image = #imageLiteral(resourceName: "animal attack")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("RESIST")) ? (self.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("CRUELTY TO ANIMALS")) ? (self.imageView?.image = #imageLiteral(resourceName: "animal cruelty")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("DOG ATTACK")) ? (self.imageView?.image = #imageLiteral(resourceName: "dog attack")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("LOST PROPERTY")) ? (self.imageView?.image = #imageLiteral(resourceName: "lost property")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("LICENSE SUSPENDED")) ? (self.imageView?.image = #imageLiteral(resourceName: "License Suspended")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("MISSING PERSON")) ? (self.imageView?.image = #imageLiteral(resourceName: "missing person")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("ELUDE")) ? (self.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("RUNAWAY")) ? (self.imageView?.image = #imageLiteral(resourceName: "missing person")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("THREATEN CRIME")) ? (self.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("TRESPASS")) ? (self.imageView?.image = #imageLiteral(resourceName: "trespass")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("VIOLATION")) ? (self.imageView?.image = #imageLiteral(resourceName: "Court")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("OPERATING VEH")) ? (self.imageView?.image = #imageLiteral(resourceName: "vehicle")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("DEATH")) ? (self.imageView?.image = #imageLiteral(resourceName: "death")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("STALKING")) ? (self.imageView?.image = #imageLiteral(resourceName: "Suspicious")) : (((self.imageView?.image = nil) != nil))
            && (description.contains("MEDICAL")) ? (self.imageView?.image = #imageLiteral(resourceName: "medical")) : (self.imageView?.image = nil)
        
        
    }
    
   
    
}
