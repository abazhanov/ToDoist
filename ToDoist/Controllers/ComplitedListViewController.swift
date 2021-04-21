//
//  ComplitedListViewController.swift
//  ToDoist
//
//  Created by Dmitry on 16.04.2021.
//

import UIKit

class ComplitedListViewController: UITableViewController {
    
    var tasks = TaskDataManagerImpl.shared.getTask(by: .done)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let compList = tasks[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = compList.name
        cell.contentConfiguration = content
        
        return cell
    }

}
