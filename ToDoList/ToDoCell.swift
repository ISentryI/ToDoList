//
//  ToDoCell.swift
//  ToDoList
//
//  Created by ERIC MARTINEZ PAREDES on 09/09/18.
//  Copyright © 2018 ACL. All rights reserved.
//

import UIKit


@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
    
}

class ToDoCell: UITableViewCell {
    
    var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    
    
    
}
