//
//  TaskDetailsView.swift
//  ToDoApp
//
//  Created by Szczepan Abramczyk on 11/12/24.
//

import SwiftUI
import SwiftData

struct TaskDetailsView: View {
    var task: TaskModel
    
    init(task: TaskModel) {
        self.task = task
    }

    var body: some View {
        HStack {
            VStack{
                Text(task.title).font(.headline).dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility3/*@END_MENU_TOKEN@*/)
                Text(task.addDate, style: .date).font(.subheadline)
            }
            Image(systemName: task.isComplete ? "checkmark.circle.fill" : "checkmark.circle").foregroundStyle(.tint)
        }
        Spacer()
        Text(task.content)
        Spacer()



        Spacer()
    }
}

#Preview {
    TaskDetailsView(task: TaskModel(title: "", content: "", isComplete: false, addDate: .now))
}
