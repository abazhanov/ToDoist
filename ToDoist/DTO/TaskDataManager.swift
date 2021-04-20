//
//  TaskDataManager.swift
//  ToDoist
//
//  Created by Artem Bazhanov on 19.04.2021.
//


protocol TaskDataManager {
    func insertTask(task: Task)
    func deleteTask(task: Task)
    func getTask(task: Task) -> Task?
    func getTotalCount() -> Int
}
