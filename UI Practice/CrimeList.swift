//
//  CrimeList.swift
//  Crime Tracker
//
//  Created by user on 11/27/17.
//  Copyright © 2017 Alphonso. All rights reserved.
//

import UIKit

class CrimeList: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    let datasource = APIData().info
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

   

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.detailTextLabel?.text = datasource
        // Configure the cell...

        return cell
    }
    

}
