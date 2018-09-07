//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by ERIC MARTINEZ PAREDES on 07/09/18.
//  Copyright © 2018 ACL. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePicker.date)
    }
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func updateDueDateLabel(date: Date){
        dueDateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    var isPickerHidden = true
    var todo: ToDo?
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch (indexPath) {
        case [1,0]:
            return isPickerHidden ? normalCellHeight : largeCellHeight
        case [2,0]:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath){
        case [1,0]:
            isPickerHidden = !isPickerHidden
            dueDateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        default: break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text
        
        todo = ToDo(dueDate: dueDate, title: title, isComplete: isComplete, notes: notes)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDueDateLabel(date: dueDatePicker.date)
        updateSaveButtonState()
    }
    
}




