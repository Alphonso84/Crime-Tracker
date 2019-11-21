//
//  CrimeList.swift
//  Crime Tracker
//
//  Created by user on 11/27/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

var crimeDescription = String()


class CrimeList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
       
    }


    // MARK: - TABLEVIEW CONFIG

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65.00
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return CrimeData.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        cell.textLabel?.font = UIFont(name: "Menlo", size: 15.00)
        let dates = CrimeData[indexPath.row].date
        let description = CrimeData[indexPath.row].crimeDescription
     
        
        //(Unfold to View) Function uses Ternary Operator to peform logic to assign images to cells.
        func imageForCellRow() {
       //THERE HAS TO BE A BETTER WAY TO IMPLEMENT THIS LOGIC //ALREADY TRIED SWITCH//IF/ELSE
            (description.contains("EOD")) ? (cell.imageView?.image = #imageLiteral(resourceName: "explosive")) : (((cell.imageView?.image = nil) != nil))
                 && (description.contains("RECKLESS")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Reckless")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("SUSPICIOUS")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Suspicious")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("ARREST")) ? (cell.imageView?.image = UIImage(named: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("STOLEN AUTO")) ? (cell.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("TAKE VEHICLE")) ? (cell.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("TRAFFIC COLLISION")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Collision")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("STOLEN VEHICLE")) ? (cell.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("DUI")) ? (cell.imageView?.image = #imageLiteral(resourceName: "DUI")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("CONTROLLED SUBSTANCE")) ? (cell.imageView?.image = #imageLiteral(resourceName: "drugs")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("BURGLARY")) ? (cell.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("THEFT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("OUTSIDE AGENCY ASSIST")) ? (cell.imageView?.image = #imageLiteral(resourceName: "AGENCY ASSIST")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("INCIDENT REPORT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "incident report")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("REPORT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "incident report")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("VANDALISM")) ? (cell.imageView?.image = #imageLiteral(resourceName: "vandalism")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("ROBBERY")) ? (cell.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("UNLICENSED")) ? (cell.imageView?.image = #imageLiteral(resourceName: "unlicensed")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("EVADE")) ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("EVADING")) ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("WARRANT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("WEAPON")) ? (cell.imageView?.image = #imageLiteral(resourceName: "weapons")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("GUN")) ? (cell.imageView?.image = #imageLiteral(resourceName: "weapons")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("MURDER")) ? (cell.imageView?.image = #imageLiteral(resourceName: "murder")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("BATTERY")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Battery")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("DISTURB BY LOUD")) ? (cell.imageView?.image = #imageLiteral(resourceName: "disturbance")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("MENTAL HEALTH")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Mental Health")) : (((cell.imageView?.image = nil) != nil)) && (description.contains("SPEED")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Speeding")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("TOW")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Tow")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("INJURY")) ? (cell.imageView?.image = #imageLiteral(resourceName: "injury")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("FIREARM")) ? (cell.imageView?.image = #imageLiteral(resourceName: "FIreArm")) : (((cell.imageView?.image = nil) != nil)) && (description.contains("SHOOT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Shooting")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("COURT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Court")) : (((cell.imageView?.image = nil) != nil))
//                && (description.contains("VEHICLE ACCIDENT")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Collision")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("ATTACKING ANIMAL")) ? (cell.imageView?.image = #imageLiteral(resourceName: "animal attack")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("RESIST")) ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("CRUELTY TO ANIMALS")) ? (cell.imageView?.image = #imageLiteral(resourceName: "animal cruelty")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("DOG ATTACK")) ? (cell.imageView?.image = #imageLiteral(resourceName: "dog attack")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("LOST PROPERTY")) ? (cell.imageView?.image = #imageLiteral(resourceName: "lost property")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("LICENSE SUSPENDED")) ? (cell.imageView?.image = #imageLiteral(resourceName: "License Suspended")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("MISSING PERSON")) ? (cell.imageView?.image = #imageLiteral(resourceName: "missing person")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("ELUDE")) ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("RUNAWAY")) ? (cell.imageView?.image = #imageLiteral(resourceName: "missing person")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("THREATEN CRIME")) ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("TRESPASS")) ? (cell.imageView?.image = #imageLiteral(resourceName: "trespass")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("VIOLATION")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Court")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("OPERATING VEH")) ? (cell.imageView?.image = #imageLiteral(resourceName: "vehicle")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("DEATH")) ? (cell.imageView?.image = #imageLiteral(resourceName: "death")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("STALKING")) ? (cell.imageView?.image = #imageLiteral(resourceName: "Suspicious")) : (((cell.imageView?.image = nil) != nil))
                && (description.contains("MEDICAL")) ? (cell.imageView?.image = #imageLiteral(resourceName: "medical")) : (cell.imageView?.image = nil)
        
        }
        imageForCellRow()
        cell.textLabel?.text = description
        cell.detailTextLabel?.text = dates
        
       
        return cell
    }
       
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let NewViewController = storyboard?.instantiateViewController(withIdentifier: "CrimeInstanceView") as! CrimeInstanceView
        //Assigns value to variable in CrimeIntanceView
        NewViewController.stringForCrimeDescriptionLabel = CrimeData[indexPath.row].crimeDescription
        //print(CrimeData[indexPath.row].crimeDescription)
        
        //Assigns value to variable in CrimeIntanceView
        NewViewController.stringForblockCityStateLabel = "\(CrimeData[indexPath.row].block) ,\(CrimeData[indexPath.row].city ) ,\(CrimeData[indexPath.row].state)"
        
        
        //Assigning Global Variables to be used in CrimeMap
        dateCrime = CrimeData[indexPath.row].date
        stringCrime = CrimeData[indexPath.row].crimeDescription
        lat = (CrimeData[indexPath.row].location1.coordinates[1])
        long = (CrimeData[indexPath.row].location1.coordinates[0])
        //Assigns value to variable in CrimeIntanceView
        NewViewController.stringForDateLabel = CrimeData[indexPath.row].date
        
            
        
        navigationController?.show(NewViewController, sender: tableView)
        
    }
    

}

















