//
//  ContentView.swift
//  ToDoApp
//
//  Created by Szczepan Abramczyk on 11/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query<TaskModel> var tasks: [TaskModel]
    
    var body: some View {
        NavigationView {
            List(tasks, id: \.title) { task in
                TaskRow(selectedTask: task)
            }
            
            .navigationTitle("Your To Dos")
            .toolbar {
                NavigationLink(destination: AddTask()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

struct TaskRow: View {
    var selectedTask: TaskModel
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationLink(destination: TaskDetailsView(task: selectedTask)) {

            HStack {
                VStack {
                    Text(selectedTask.title)
                        .font(.headline)
                    Text(selectedTask.content)
                        .font(.subheadline)
                }
                Spacer()
                Spacer()
                
                if(selectedTask.isComplete) {
                    Image(systemName: "checkmark.circle.fill").onTapGesture {
                        toggleComplete(task: selectedTask)
                    }.foregroundStyle(.tint)
                }else {
                    Image(systemName: "checkmark.circle").onTapGesture {
                        toggleComplete(task: selectedTask)
                    }.foregroundStyle(.tint)
                }
                Image(systemName: "trash").onTapGesture {
                    deleteTask(task: selectedTask)
                }.foregroundStyle(.tint)
                
                
            }
        }
    }
        
        func deleteTask(task: TaskModel) {
        `context`.delete(task)
    }
    
        func toggleComplete(task: TaskModel) {
            task.isComplete.toggle()
            do {
                try context.save()
            }catch {
                
                print("Error saving task: \(error)")
            }
        }
    
}

#Preview {
    ContentView().modelContainer(for: TaskModel.self, inMemory: true)
}
