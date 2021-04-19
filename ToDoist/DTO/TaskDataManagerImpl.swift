//
//  TaskDataManagerImpl.swift
//  ToDoist
//
//  Created by Artem Bazhanov on 19.04.2021.
//

class TaskDataManagerImpl: TaskDataManager {
    static let shared = TaskDataManagerImpl()

    private var tasks: [ImportantStatus: [Task]] = [:]

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
}
