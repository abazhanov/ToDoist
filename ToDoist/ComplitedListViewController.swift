//
//  ComplitedListViewController.swift
//  ToDoist
//
//  Created by Dmitry on 16.04.2021.
//

import UIKit

class ComplitedListViewController: UITableViewController {
    
    var list = ComplitedList.getCompList()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let compList = list[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = compList.list
        cell.contentConfiguration = content
        
        return cell
    }

}
