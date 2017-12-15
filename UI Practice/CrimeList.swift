//
//  CrimeList.swift
//  Crime Tracker
//
//  Created by user on 11/27/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class CrimeList: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    
    let datasource = CrimeArray
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
tableView.reloadData()
       
    }

   

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datasource.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let crimeDescription = CrimeArray[indexPath.row]["crimedescription"] as! String
        let date = CrimeArray[indexPath.row]["datetime"] as! String
        // Configure the cell...
        
        cell.textLabel?.text = crimeDescription
        cell.detailTextLabel?.text = date
        
        

        return cell
    }
    

}
