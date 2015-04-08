//
//  SecondViewController.swift
//  todolist
//
//  Created by Developer on 08/04/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate, SwiftColorPickerDelegate {

    
    @IBOutlet var txtCategory: UITextField!
    var categoryColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Events
    @IBAction func btdAddCategory(sender: UIButton) {
        
        categoryManager.addCategory(txtCategory.text, color: categoryColor, tasks: taskManager)
        self.view.endEditing(true)
        txtCategory.text = ""
        
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
    
    
    
    //ColorPicker
    @IBAction func showColorPicker(sender: UIButton) {
        
        let colorPickerVC = SwiftColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.modalPresentationStyle = .Popover
        
        let popVC = colorPickerVC.popoverPresentationController!
        popVC.sourceRect = sender.frame
        popVC.sourceView = self.view
        popVC.permittedArrowDirections = .Any
        popVC.delegate = self;
        
        self.presentViewController(colorPickerVC, animated: true, completion: {
            
            
            println("Reade<");
        })
        
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func colorSelectionChanged(selectedColor color: UIColor) {
        categoryColor = color
        
    }

}

