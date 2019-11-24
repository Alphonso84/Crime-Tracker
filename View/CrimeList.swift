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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CrimeTableViewCell
        cell.configureCell(indexPath: indexPath)
        cell.configureCellImage(indexPath: indexPath)
        
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

















