//
//  Task.swift
//  Shirayo's_To_Do_List
//
//  Created by Shirayo on 08.06.2020.
//  Copyright © 2020 Shirayo. All rights reserved.
//

import Foundation

class Task {
    var taskName: String = "heh"
    var isDone: Bool = false
    
    init(_ text: String, _ isDone: Bool = false) {
        self.taskName = text
        self.isDone = isDone
    }
    
    
}
