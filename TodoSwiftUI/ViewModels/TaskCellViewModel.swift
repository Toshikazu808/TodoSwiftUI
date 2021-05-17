//
//  TaskCellViewModel.swift
//  TodoSwiftUI
//
//  Created by Ryan Kanno on 5/16/21.
//

import Foundation
import Combine

class TaskCellViewModel: ObservableObject, Identifiable {
   @Published var task: TaskModel
   var id = ""
   @Published var completionStateIconName: String = ""
   private var cancelables = Set<AnyCancellable>()
   
   init(task: TaskModel) {
      self.task =  task
      $task.map { task in
         task.completed ? "checkmark.circle.fill" : "circle"
      }
      .assign(to: \.completionStateIconName, on: self)
      .store(in: &cancelables)
      
      $task.map { task in
         task.id
      }
      .assign(to: \.id, on: self)
      .store(in: &cancelables)
   }
}
