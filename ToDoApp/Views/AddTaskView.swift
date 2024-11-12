//
//  AddTask.swift
//  ToDoApp
//
//  Created by Szczepan Abramczyk on 11/11/24.
//

import SwiftUI
import SwiftData

struct AddTask: View {
    @State var newTitle: String = ""
    @State var newContent: String = ""
    @Environment(\.modelContext) private var context
    
    var body: some View {
        TextField("Title", text: $newTitle)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        TextField("Content", text: $newContent)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        Button(action: {addTask()}) {
            Text("Add")
        }
    }
    
    func addTask() {
        let newTask = TaskModel(title: newTitle, content: newContent, isComplete: false, addDate: Date.now)
        context.insert(newTask)
        
        newTitle.removeAll()
        newContent.removeAll()
    }
}

#Preview {
    AddTask().modelContainer(for: TaskModel.self, inMemory: true)
}
