//
//  TableViewController.swift
//  ToDoList
//
//  Created by Eric Martínez Paredes on 03/09/18.
//  Copyright © 2018 ACL. All rights reserved.
//

import UIKit

class ToDoTableViewController : UITableViewController {
    
    var todos = [ToDo]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier") else {
            fatalError("Could not dequeue a cell")
        }
        let todo = todos[indexPath.row]
        cell.textLabel?.text =  todo.title
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedToDos = ToDo.loadToDos() {
            todos = savedToDos
        } else {
            todos = ToDo.loadSampleToDos()
        }
    }

    
}