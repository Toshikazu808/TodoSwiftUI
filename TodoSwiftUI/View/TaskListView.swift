//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by Ryan Kanno on 5/16/21.
//

import SwiftUI

struct TaskListView: View {
   let tasks = testDataTasks
   
   var body: some View {
      NavigationView {
         VStack(alignment: .leading) {
            List(tasks) { task in
               TaskCell(task: task)
            }

         } //: VSTACK
         .navigationBarTitle("Tasks")
         .navigationBarItems(
            trailing: Button(action: {}) {
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
   let task: TaskModel
   
   var body: some View {
      HStack {
         Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
            .resizable()
            .frame(width: 20, height: 20)
         Text(task.title)
            .padding()
      }
   }
}
