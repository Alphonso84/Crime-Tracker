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
       print(county)
    }


    // MARK: - TABLEVIEW CONFIG

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if county == "CC COUNTY" {
            return CCCrimeData.count
        }else{
                return CrimeData.count
            }
      
    }
        
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        
        if county == "CC COUNTY" {
          cell.textLabel?.text = CCCrimeData[indexPath.row]["incident_type_primary"] as? String
          cell.detailTextLabel?.text = CCCrimeData[indexPath.row]["incident_datetime"] as? String
            return cell
        }else{
            cell.textLabel?.text = CrimeData[indexPath.row].crimeDescription
            cell.detailTextLabel?.text = CrimeData[indexPath.row].date
            return cell
        }
      
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let NewViewController = storyboard?.instantiateViewController(withIdentifier: "CrimeInstanceView") as! CrimeInstanceView
        //Assigns value to variable in CrimeIntanceView
        if county == "ALAMEDA COUNTY" {
        NewViewController.stringForCrimeDescriptionLabel = CrimeData[indexPath.row].crimeDescription
        //print(CrimeData[indexPath.row].crimeDescription)
        
        //Assigns value to variable in CrimeIntanceView
        NewViewController.stringForblockCityStateLabel = "\(CrimeData[indexPath.row].block) ,\(CrimeData[indexPath.row].city ) ,\(CrimeData[indexPath.row].state)"
        
        print( CrimeData[indexPath.row].location1.coordinates)
        //Assigns value to variable in CrimeIntanceView
        NewViewController.stringForDateLabel = CrimeData[indexPath.row].date
        
        }else{
            NewViewController.stringForCrimeDescriptionLabel = CCCrimeData[indexPath.row]["incident_type_primary"] as! String
            //print(CrimeData[indexPath.row].crimeDescription)
            
            //Assigns value to variable in CrimeIntanceView
            NewViewController.stringForblockCityStateLabel = CCCrimeData[indexPath.row]["address_1"] as! String
            
            
            //Assigns value to variable in CrimeIntanceView
            NewViewController.stringForDateLabel = CCCrimeData[indexPath.row]["incident_datetime"] as! String
            
            
        }
       navigationController?.show(NewViewController, sender: tableView)
    }
    

}
















