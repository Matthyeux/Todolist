//
//  ViewController.swift
//  todolist
//
//  Created by Developer on 14/04/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblTasks: UITableView!
    var taskmanager:TaskManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //returning the view
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    //UITableViewDelete
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            taskManager.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData()
        }
    }
    
    //UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskManager.tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.detailTextLabel?.text = taskmanager?.tasks[indexPath.row].name
        return cell
    }
    
    
    

    

}
