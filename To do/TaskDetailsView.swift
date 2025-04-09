//
//  TaskDetailsView.swift
//  To do
//
//  Created by Szczepan Abramczyk on 09/04/2025.
//

import SwiftUI
import SwiftData

struct TaskDetailsView: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Binding var task: Task
    @State var editView: Bool = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(systemName: task.priority.icon).foregroundStyle(task.priority.color).font(.caption)
                Text(task.title).font(.title)
                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(task.isDone ? .green : .gray).font(.title2).onTapGesture {
                    withAnimation(Animation.linear(duration: 0.1)){
                        task.isDone.toggle()
                    }
                }
                Spacer()
                Image(systemName: "pencil").onTapGesture {
                    editView.toggle()
                }.sheet(isPresented: $editView) {
                    EditTaskView(task: $task).presentationDetents([.fraction(0.3)])
                        .presentationDragIndicator(.hidden)
                }
                Image(systemName: "trash").foregroundStyle(.red).onTapGesture {
                    withAnimation(Animation.linear(duration: 0.1)) {
                        dismiss()
                        context.delete(task)}
                }
            }.padding(.horizontal, 20)
            Text(task.endDate.formatted(date: .numeric, time: .shortened)).font(.caption).foregroundStyle(.gray).padding(.bottom)
            Text(task.topic)
            
        }
    }
}

#Preview {
    @Previewable @State var prv = Task(title: "title", topic: "topic", isDone: false, priority: TaskPriority.important, endDate: Date.now)
     TaskDetailsView(task: $prv).modelContainer(for: Task.self)
}
