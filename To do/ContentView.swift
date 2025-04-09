//
//  ContentView.swift
//  To do
//
//  Created by Szczepan Abramczyk on 07/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var Tasks: [Task]
    @State var openAddTask: Bool = false
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Spacer()
                    Text("Your to do list").font(.title3).fontWeight(.thin)
                    Spacer()
                    Button(action: {openAddTask.toggle()}) {
                        Image(systemName: "plus").font(.title2)
                    }
                    .sheet(isPresented: $openAddTask, content: {
                        AddTaskView().presentationDetents([.fraction(0.35)])
                            .presentationDragIndicator(.hidden)
                    })
                }
                .padding(.horizontal)
                
                ScrollView() {
                    
                    ForEach (self.Tasks, id: \.self) { task in
                        TaskView(task: task)
                    }
                }
                .padding()
                .frame(width: geo.size.width, height: geo.size.height * 0.9)
            }
        }.fontWeight(.thin)
        
    }
}


#Preview {
    ContentView().modelContainer(for: Task.self, inMemory: true)
}

struct TaskView: View {
    @State var task: Task
    @State var showTaskDetails: Bool = false
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(task.title).font(.title3)
                    
                        Text(task.endDate.formatted(date: .numeric, time: .shortened)).font(.caption)
                    
                }.padding(.horizontal)
                .foregroundStyle(task.priority.color)
                Spacer()
                Image(systemName: task.isDone ? "checkmark.circle.fill" : "circle").foregroundColor(task.isDone ? .green : .gray).font(.title2).onTapGesture {
                    withAnimation(Animation.linear(duration: 0.1)){
                        
                        task.isDone.toggle()
                    }
                }.padding(.horizontal)
                Image(systemName: "chevron.right")
            }.sheet(isPresented: $showTaskDetails) {
                TaskDetailsView(task: $task).presentationDetents([.fraction(0.2)])
                        .presentationDragIndicator(.hidden)
            }
            Divider()
        }.onTapGesture {showTaskDetails.toggle()}
    }
}
