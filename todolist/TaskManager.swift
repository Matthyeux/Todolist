//
//  TaskManager.swift
//  todolist
//
//  Created by Developer on 08/04/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit

var taskManager: TaskManager = TaskManager()

struct task {
    var name = "Un-Named"
    var desc = "Un-Described"
}

class TaskManager: NSObject {
    
    var tasks = [task]()
    
    func addTask(name: String, desc: String) {
        tasks.append(task(name: name, desc: desc))
    }
    
}
