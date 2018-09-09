//
//  ToDo.swift
//  ToDoList
//
//  Created by Eric Martínez Paredes on 03/09/18.
//  Copyright © 2018 ACL. All rights reserved.
//

import UIKit

struct ToDo: Codable {
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
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    
    static func loadToDos() -> [ToDo]? {
        guard let codeToDos = try? Data(contentsOf: ArchiveURL)
            else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codeToDos)
    }
    
    static func saveToDos(_ todos: [ToDo]){
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(dueDate: Date(), title: "ToDo 1", isComplete: false, notes: "Nota 1")
        let todo2 = ToDo(dueDate: Date(), title: "ToDo 2", isComplete: false, notes: "Nota 2")
        let todo3 = ToDo(dueDate: Date(), title: "ToDo 3", isComplete: false, notes: "Nota 3")
        
        return [todo1, todo2, todo3]
    }
    
}
