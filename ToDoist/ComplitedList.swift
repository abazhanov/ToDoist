//
//  ComplitedList.swift
//  ToDoist
//
//  Created by Dmitry on 16.04.2021.
//

import Foundation

struct ComplitedList {
    let list: String
}

extension ComplitedList {
    static func getCompList() -> [ComplitedList] {
        [
            ComplitedList(list: "Walk"),
            ComplitedList(list: "Eat"),
            ComplitedList(list: "Eat"),
            ComplitedList(list: "Buy")
        ]
    }
}
