//
//  To_doApp.swift
//  To do
//
//  Created by Szczepan Abramczyk on 07/04/2025.
//

import SwiftUI

@main
struct To_doApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Task.self)
        }
    }
}
