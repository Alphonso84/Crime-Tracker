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
        let dates = CrimeData[indexPath.row].date
//        let description = crimeTitle[indexPath.row]
        let description = CrimeData[indexPath.row].crimeDescription
       // CrimeData[indexPath.row].crimeDescription
        
        description.contains("EOD") ? (cell.imageView?.image = #imageLiteral(resourceName: "explosive")) : (((cell.imageView?.image = nil) != nil)) && description.contains("RECKLESS") ? (cell.imageView?.image = #imageLiteral(resourceName: "Reckless")) :
            (((cell.imageView?.image = nil) != nil)) && description.contains("SUSPICIOUS") ? (cell.imageView?.image = #imageLiteral(resourceName: "Suspicious")) : (((cell.imageView?.image = nil) != nil)) &&
            description.contains("ARREST") ? (cell.imageView?.image = #imageLiteral(resourceName: "arrest")) : (((cell.imageView?.image = nil) != nil)) && description.contains("STOLEN AUTO") ? (cell.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((cell.imageView?.image = nil) != nil)) && description.contains("TAKE VEHICLE") ? (cell.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((cell.imageView?.image = nil) != nil))
            && description.contains("TRAFFIC COLLISION") ? (cell.imageView?.image = #imageLiteral(resourceName: "Collision")) : (((cell.imageView?.image = nil) != nil)) && description.contains("STOLEN VEHICLE") ? (cell.imageView?.image = #imageLiteral(resourceName: "stolen vehicle")) : (((cell.imageView?.image = nil) != nil)) && description.contains("DUI") ? (cell.imageView?.image = #imageLiteral(resourceName: "DUI")) : (((cell.imageView?.image = nil) != nil)) && description.contains("POSSESS CONTROLLED SUBSTANCE") ? (cell.imageView?.image = #imageLiteral(resourceName: "drugs")) : (((cell.imageView?.image = nil) != nil)) && description.contains("BURGLARY") ? (cell.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((cell.imageView?.image = nil) != nil)) && description.contains("THEFT") ? (cell.imageView?.image = #imageLiteral(resourceName: "burglary")) : (((cell.imageView?.image = nil) != nil)) && description.contains("OUTSIDE AGENCY ASSIST") ? (cell.imageView?.image = #imageLiteral(resourceName: "AGENCY ASSIST")) : (((cell.imageView?.image = nil) != nil)) && description.contains("INCIDENT REPORT") ? (cell.imageView?.image = #imageLiteral(resourceName: "incident report")) : (((cell.imageView?.image = nil) != nil)) && description.contains("INFORMATIONAL REPORT") ? (cell.imageView?.image = #imageLiteral(resourceName: "incident report")) : (cell.imageView?.image = nil)
        
        
        
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
        lat = CrimeData[indexPath.row].location1.coordinates[1]
        long = CrimeData[indexPath.row].location1.coordinates[0]
        //Assigns value to variable in CrimeIntanceView
        NewViewController.stringForDateLabel = CrimeData[indexPath.row].date
        
            
        
        navigationController?.show(NewViewController, sender: tableView)
        
    }
    

}

















