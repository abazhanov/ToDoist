//
//  Task.swift
//  ToDoist
//
//  Created by Artem Bazhanov on 19.04.2021.
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
