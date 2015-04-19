//
//  ViewAddTask.swift
//  todolist
//
//  Created by Developer on 18/04/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit

class ViewAddTask: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var descTask: UITextField!
    @IBOutlet var nameTask: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    @IBAction func btdAddTask(sender: UIButton) {
        
        taskManager.addTask(nameTask.text, desc: descTask.text)
        self.view.endEditing(true)
        descTask.text=""
        nameTask.text=""
        
        self.tabBarController?.selectedIndex = 0
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    //UITextField Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
