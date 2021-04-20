//
//  ComplitedListViewController.swift
//  ToDoist
//
//  Created by Dmitry on 16.04.2021.
//

import UIKit

class ComplitedListViewController: UITableViewController {
    
    var tasks = TaskDataManagerImpl.shared.tasks
    lazy var complitedTask = getTask()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complitedTask.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let compList = complitedTask[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = compList.name
        cell.contentConfiguration = content
        
        return cell
    }

}

extension ComplitedListViewController {
    private func getTask() -> [Task] {
        var newTasks: [Task] = []
        for (_,values) in tasks {
            for value in values {
                if value.status == .done {
                newTasks.append(value)
                }
            }
        }
        return newTasks
    }
}
