//
//  TaskDataManagerlmpl.swift
//  ToDoist
//
//  Created by Dmitry on 19.04.2021.
//
import Foundation

class TaskDataManagerImpl: TaskDataManager {
    static let shared = TaskDataManagerImpl()

    private init(){}
    
   var staticTask: [ImportantStatus: [Task]] = [
        .emergency: [
            Task(name: "Buy milk", description: "Buy milk in nearest store", estimateDate: Date(), status: .done, importantStatus: .emergency),
            Task(name: "Send email", description: "Send email for John", estimateDate: Date(), status: .undone, importantStatus: .emergency)
        ],
        .normal: [
            Task(name: "Buy soda", description: "Buy soda in nearest store", estimateDate: Date(), status: .undone, importantStatus: .normal),
            Task(name: "Call grandma", description: "Call grandma", estimateDate: Date(), status: .done, importantStatus: .normal),
            Task(name: "Write an app", description: "With xcode", estimateDate: Date(), status: .undone, importantStatus: .normal)
        ],
        .low: [
            Task(name: "Take a nap", description: "On this beautiful sofa", estimateDate: Date(), status: .undone, importantStatus: .normal),
        ]
    ]
    
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
