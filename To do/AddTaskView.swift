//
//  AddTaskView.swift
//  To do
//
//  Created by Szczepan Abramczyk on 07/04/2025.
//

import Foundation
import SwiftUI

struct AddTaskView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss

    @State var newTask: Task = Task(title: "", topic: "", isDone: false, priority: .normal, endDate: Date.now)
    @State var error: Bool = false
    var body: some View {
        Spacer()
        VStack {
                TextField("Nazwa", text: $newTask.title).textFieldStyle(UnderlinedTextFieldStyle())
                TextField("Opis", text: $newTask.topic).textFieldStyle(UnderlinedTextFieldStyle())
                DatePicker("Data zakończenia", selection: $newTask.endDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .padding(.horizontal)
                PrioritySelector(selectedPriority: $newTask.priority)
        }
        Button(action: {SaveTask(task: newTask)}) {
            Text("Dodaj")
        }.buttonStyle(.borderedProminent)
            .alert(isPresented: $error) {
                Alert(title: Text("Error"),
                      message: Text("Title cannot be empty"),
                      dismissButton: .default(Text("OK")))
            }
    }
    
    
    
    
    func SaveTask(task: Task) {
        if(task.title != "") {
            context.insert(task)
            do {
                try context.save()
                dismiss()
            } catch {
                print(error)
            }
        }else {
            error.toggle()
        }
    }
}

struct PrioritySelector: View {
    @Binding var selectedPriority: TaskPriority

    var body: some View {
        HStack {
            Text("Priorytet:")

            ForEach(TaskPriority.allCases, id: \.self) { priority in
                Image(systemName: priority.icon)
                    .foregroundColor(priority.color)
                    .padding(8)
                    .background(
                        Circle()
                            .fill(selectedPriority == priority ? Color.gray.opacity(0.3) : Color.clear)
                    )
                    .onTapGesture {
                        selectedPriority = priority
                    }
            }
        }
        .padding(6)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}


struct UnderlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 8)
            .background(
                VStack {
                    Spacer()
                    Color(UIColor.systemGray4)
                        .frame(height: 1)
                }
            )
            .padding(.horizontal)
    }
}

#Preview {
    AddTaskView()
}
