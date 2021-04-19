//
//  TaskDataManager.swift
//  ToDoist
//
//  Created by Mac on 19.04.2021.
//

class TaskDataManagerImpl: TaskDataManager {
    static let shared = TaskDataManagerImpl()

    private var tasks: [Task] = []

    func insertTask(task: Task) {
        tasks.append(task)
    }

    func deleteTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
    }

    func getTask(task: Task) -> Task? {
        tasks.filter{ $0.id == task.id }.first
    }
    
    func getTotalCount() -> Int {
        tasks.count
    }
}
