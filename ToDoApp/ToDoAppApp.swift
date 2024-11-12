//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Szczepan Abramczyk on 11/11/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoAppApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: TaskModel.self)
        }catch {
            fatalError()
        }
    }
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(container)
        }
    }
}
