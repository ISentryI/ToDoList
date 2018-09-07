//
//  ToDo.swift
//  ToDoList
//
//  Created by Eric Martínez Paredes on 03/09/18.
//  Copyright © 2018 ACL. All rights reserved.
//

import UIKit

struct ToDo {
    var dueDate : Date
    var title : String
    var isComplete : Bool
    var notes : String?
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
    
    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(dueDate: Date(), title: "ToDo 1", isComplete: false, notes: "Nota 1")
        let todo2 = ToDo(dueDate: Date(), title: "ToDo 2", isComplete: false, notes: "Nota 2")
        let todo3 = ToDo(dueDate: Date(), title: "ToDo 3", isComplete: false, notes: "Nota 3")
        
        return [todo1, todo2, todo3]
    }
    
    
}
