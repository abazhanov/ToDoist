//
//  Task.swift
//  ToDoist
//
//  Created by Mac on 15.04.2021.
//

//Модель:
//- название
//- описание
//- дата
//- статус
//-- новая
//-- завершена
import Foundation

struct Task {
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
