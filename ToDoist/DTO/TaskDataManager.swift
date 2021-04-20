//
//  TaskDataManager.swift
//  ToDoist
//
<<<<<<< HEAD
//  Created by Dmitry on 19.04.2021.
//

=======
//  Created by Artem Bazhanov on 19.04.2021.
//


>>>>>>> 6e3f08e03e52c9d320e792296dec9c878e6eecf5
protocol TaskDataManager {
    func insertTask(task: Task)
    func deleteTask(task: Task)
    func getTask(task: Task) -> Task?
    func getTotalCount() -> Int
}
