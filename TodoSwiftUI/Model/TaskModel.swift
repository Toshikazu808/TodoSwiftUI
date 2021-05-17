//
//  TaskModel.swift
//  TodoSwiftUI
//
//  Created by Ryan Kanno on 5/16/21.
//

import Foundation

struct TaskModel: Identifiable {
   var id: String = UUID().uuidString
   var title: String
   var completed: Bool
}

#if DEBUG
let testDataTasks = [
   TaskModel(title: "Implement the UI", completed: true),
   TaskModel(title: "Connect to Firebase", completed: false),
   TaskModel(title: "????", completed: false),
   TaskModel(title: "Profit!", completed: false)
]
#endif
