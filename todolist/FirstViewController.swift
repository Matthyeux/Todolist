
//
//  FirstViewController.swift
//  todolist
//
//  Created by Developer on 08/04/2015.
//  Copyright (c) 2015 Developer. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblCategories: UITableView!
    var categorieDest:TaskManager?

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
        tblCategories.reloadData()
    }
    
    //UITableViewDelete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete) {
            categoryManager.categories.removeAtIndex(indexPath.row)
            tblCategories.reloadData()
        }
    }
    
    //UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryManager.categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        
        cell.detailTextLabel?.text = categoryManager.categories[indexPath.row].name
        cell.detailTextLabel?.textColor = UIColor.whiteColor()
        cell.backgroundColor = categoryManager.categories[indexPath.row].color
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("ShowTask", sender: nil)
        categorieDest = categoryManager.categories[indexPath.row].tasks
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowTask"
        {
            let destination = segue.destinationViewController as ViewController
            destination.taskmanager = categorieDest
        }
        
    }
    


}

