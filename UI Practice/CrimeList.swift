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

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CrimeData.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Configure the cell...
        
        cell.textLabel?.text = CrimeData[indexPath.row].crimeDescription
        cell.detailTextLabel?.text = CrimeData[indexPath.row].date
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let NewViewController = storyboard?.instantiateViewController(withIdentifier: "CrimeInstanceView") as! CrimeInstanceView
        
        NewViewController.stringForCrimeDescriptionLabel = CrimeData[indexPath.row].crimeDescription
        print(CrimeData[indexPath.row].crimeDescription)
        
        
        NewViewController.stringForblockCityStateLabel = "\(CrimeData[indexPath.row].block) ,\(CrimeData[indexPath.row].city ) ,\(CrimeData[indexPath.row].state)"
        
        navigationController?.show(NewViewController, sender: tableView)
        
    }
    

}
















