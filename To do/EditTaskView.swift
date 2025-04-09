//
//  AddTaskView.swift
//  To do
//
//  Created by Szczepan Abramczyk on 07/04/2025.
//

import Foundation
import SwiftUI

struct EditTaskView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @Binding var task: Task
    
    var body: some View {
        Spacer()
        VStack {
                TextField("Opis", text: $task.topic).textFieldStyle(UnderlinedTextFieldStyle())
                DatePicker("Data zakończenia", selection: $task.endDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .padding(.horizontal)
                PrioritySelector(selectedPriority: $task.priority)
        }
        Button(action: {SaveTask(task: task)}) {
            Text("Edytuj")
        }.buttonStyle(.borderedProminent)
    }
    
    
    
    
    func SaveTask(task: Task) {
        context.insert(task)
        do {
            try context.save()
            dismiss()
        } catch {
            print(error)
        }
    }
}

#Preview {
    @Previewable @State var prv = Task(title: "title", topic: "topic", isDone: false, priority: TaskPriority.important, endDate: Date.now)
    EditTaskView(task: $prv)
}
