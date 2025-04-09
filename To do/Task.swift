//
//  Task.swift
//  To do
//
//  Created by Szczepan Abramczyk on 07/04/2025.
//

import SwiftData
import Foundation
import SwiftUI



@Model
final class Task: Identifiable {
    var id: UUID
    var title: String
    var topic: String
    var isDone: Bool
    var priority: TaskPriority
    var createdAt: Date
    var endDate: Date
    
    init(
    id: UUID = .init(),
    title: String,
    topic: String,
    isDone: Bool,
    priority: TaskPriority,
    createdAt: Date = Date(),
    endDate: Date
    ) {
        self.id = id
        self.title = title
        self.topic = topic
        self.isDone = isDone
        self.priority = priority
        self.createdAt = createdAt
        self.endDate = endDate
    }
}


enum TaskPriority: Int, CaseIterable, Codable {
    case normal = 0
    case important = 1
    case veryImportant = 2
    
    var icon: String {
        switch self {
        case .normal:
            return "circle.fill"
        case .important:
            return "exclamationmark.triangle.fill"
        case .veryImportant:
            return "exclamationmark.octagon.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .normal:
            return .green
        case .important:
            return .orange
        case .veryImportant:
            return .red
        }
    }
    
    var name: String {
        switch self {
        case .normal:
            return "Normal"
        case .important:
            return "Important"
        case .veryImportant:
            return "Very Important"
        }
    }
}
