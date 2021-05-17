//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by Ryan Kanno on 5/16/21.
//

import SwiftUI

struct TaskListView: View {
   // This will allow SwiftUI to listen to any updates that is produced
   @ObservedObject var taskListViewModel = TaskListViewModel()
   let tasks = testDataTasks
   @State private var presentAddNewItem = false
   
   var body: some View {
      NavigationView {
         VStack(alignment: .leading) {
            List {
               ForEach(taskListViewModel.taskCellViewModels) { taskCellVM in
                  TaskCell(taskCellVM: taskCellVM)
               } //: LOOP
               if presentAddNewItem == true {
                  TaskCell(taskCellVM: TaskCellViewModel(task: TaskModel(title: "", completed: false))) {
                     task in
                     self.taskListViewModel.addTask(task: task)
                     self.presentAddNewItem.toggle()
                  }
               }
            } //: LIST
         } //: VSTACK
         .navigationBarTitle("Tasks")
         .navigationBarItems(
            trailing: Button(action: {
               self.presentAddNewItem.toggle()
            }) {
               Text("Add")
                  .font(.title3)
                  .fontWeight(.bold)
            }
         )
      } //: NAVIGATIONA
      
   }
}

struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      TaskListView()
   }
}

struct TaskCell: View {
   @ObservedObject var taskCellVM: TaskCellViewModel
//   let task: TaskModel
   var onCommit: (TaskModel) -> (Void) = { _ in }
   
   var body: some View {
      HStack {
         Image(systemName: taskCellVM.task.completed ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
            .onTapGesture {
               self.taskCellVM.task.completed.toggle()
            }
         TextField("Enter task title", text: $taskCellVM.task.title, onCommit: {
            self.onCommit(self.taskCellVM.task)
         })
         
//         Text(taskCellVM.task.title)
//            .padding()
      }
   }
}
