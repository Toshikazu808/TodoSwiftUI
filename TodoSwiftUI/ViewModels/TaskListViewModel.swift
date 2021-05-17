//
//  TaskListViewModel.swift
//  TodoSwiftUI
//
//  Created by Ryan Kanno on 5/16/21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
   @Published var taskCellViewModels: [TaskCellViewModel] = []
   private var cancellables = Set<AnyCancellable>()
   
   init() {
      self.taskCellViewModels = testDataTasks.map { task in
         TaskCellViewModel(task: task)
      }
   }
   
   func addTask(task: TaskModel) {
      let taskVM = TaskCellViewModel(task: task)
      self.taskCellViewModels.append(taskVM)
   }
}
