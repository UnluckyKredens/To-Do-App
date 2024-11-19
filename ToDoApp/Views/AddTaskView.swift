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
        Text("Add Title and content of your task").font(.title3)
        TextField("Title", text: $newTitle)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        TextEditor(text: $newContent)
            .frame(height: 100)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(.gray.opacity(0.2) , lineWidth: 1))
            .padding()
            
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
