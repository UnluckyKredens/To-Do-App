//
//  TaskModel.swift
//  ToDoApp
//
//  Created by Szczepan Abramczyk on 11/11/24.
//

import Foundation
import SwiftData

@Model
class TaskModel {
    var title: String
    var content: String
    var isComplete: Bool
    var addDate: Date
    var endDate: Date?
    
    init(title: String, content: String, isComplete: Bool, addDate: Date) {
        self.title = title
        self.content = content
        self.isComplete = isComplete
        self.addDate = addDate
    }
}
