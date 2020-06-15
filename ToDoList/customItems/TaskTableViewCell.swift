//
//  TaskTableViewCell.swift
//  Shirayo's_To_Do_List
//
//  Created by Shirayo on 08.06.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import UIKit

protocol TaskTableViewDelegate {
    func markButtonTapped(_ cell: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    
    var taskTextLabel =  UILabel()
    var isCompletedButton = MarkButton()
    
    var delegate: TaskTableViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func createButtonAndTaskText() {
        self.contentView.addSubview(isCompletedButton)
        self.contentView.addSubview(taskTextLabel)
        self.isCompletedButton.frame = CGRect(x: 10, y: 15, width: 40, height: 40)
        self.isCompletedButton.addTarget(self, action: #selector(markButtonTapped(button:)), for: .touchUpInside)
        
        self.isCompletedButton.translatesAutoresizingMaskIntoConstraints = false
        self.isCompletedButton.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.isCompletedButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        self.isCompletedButton.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 10).isActive = true
        self.isCompletedButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.isCompletedButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.taskTextLabel.frame = CGRect(x: 60, y: 15, width: 100, height: 40)
        self.taskTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.taskTextLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15).isActive = true
        self.taskTextLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        self.taskTextLabel.leftAnchor.constraint(equalTo: isCompletedButton.rightAnchor, constant: 20).isActive = true
        self.taskTextLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -20).isActive = true
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTask(_ task: Task) {
        taskTextLabel.text = task.taskName
        isCompletedButton.setStatus(task.isDone)
    }
    
    func makeStrikeOutText(_ value: Int) {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string:  self.taskTextLabel.text!)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: value, range: NSMakeRange(0, attributeString.length))
        self.taskTextLabel.attributedText = attributeString
    }
    
    @objc func markButtonTapped(button: MarkButton) {
        if !button.status {
            makeStrikeOutText(2)
            button.sendHapticFeedback()
            delegate?.markButtonTapped(self)
        } else {
            makeStrikeOutText(0)
            button.sendHapticFeedback()
            delegate?.markButtonTapped(self)
        }
    }
    
}


