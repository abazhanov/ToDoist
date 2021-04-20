//
<<<<<<< HEAD
//  Task.swift/Users/dmitry/Desktop/ToDoist/ToDoist/DTO/Task.swift
//  ToDoist
//
//  Created by Dmitry on 19.04.2021.
=======
//  Task.swift
//  ToDoist
//
//  Created by Artem Bazhanov on 19.04.2021.
>>>>>>> 6e3f08e03e52c9d320e792296dec9c878e6eecf5
//

import Foundation

struct Task {
    let id: UUID = UUID()
    let name: String
    let description: String
    let estimateDate: Date
    let status: Status
    let importantStatus: ImportantStatus
}

enum Status {
    case done
    case undone
}

enum ImportantStatus {
    case emergency
    case normal
    case low
}
