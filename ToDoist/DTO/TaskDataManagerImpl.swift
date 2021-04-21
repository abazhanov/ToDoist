//
//  TaskDataManager.swift
//  ToDoist
//
//  Created by Mac on 19.04.2021.
//

class TaskDataManagerImpl: TaskDataManager {
    
    static let shared = TaskDataManagerImpl()
    private var tasks: [ImportantStatus: [Task]] = [:]
    
    private init() {}

    func insertTask(task: Task) {
        tasks[task.importantStatus]?.append(task)
    }

    func deleteTask(task: Task) {
        tasks[task.importantStatus]?.removeAll { $0.id == task.id }
    }

    func getTask(task: Task) -> Task? {
        tasks[task.importantStatus]?.filter{ $0.id == task.id }.first
    }
    
    func getTotalCount() -> Int {
        var totalCount = 0
        
        tasks.forEach{
            totalCount += $0.value.count
        }
        
        return totalCount
    }
    
    func getTask(by type: Status) -> [Task] {
        var doneTasks = [Task]()
                
        for (_, task) in tasks{
            doneTasks.append(contentsOf: task.filter{
                $0.status == .done
            })
        }
        
        return doneTasks
    }
}
