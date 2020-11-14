//
//  ViewController.swift
//  Todo List
//
//  Created by Juliana de Carvalho on 2020-11-13.
//  Copyright © 2020 Juliana de Carvalho. All rights reserved.
//  Student Id: 30113760
//  Version 1.0
//  Build 1

import UIKit

class ViewController: UIViewController , UITableViewDataSource  {

    @IBOutlet weak var labelTest: UILabel!
    /*let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: "Your String here")
    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
    
    labelTest.attributedText = attributeString;
    */
    
    let cellTableIdentifier = "CellTableIdentifier"
    
    @IBOutlet var tableView:UITableView!
    let tasks = [
        ["Task" : "Schedule annual checkup", "Due" : "Tuesday, Nov 17, 2020"],
        ["Task" : "Plan my son's birthday", "Due" : "Wednesday, Nov 18, 2020"],
        ["Task" : "Enroll in a gym", "Due" : "Thursday, Nov 19, 2020"],
        ["Task" : "Buy christmas gifts", "Due" : "Thursday, Nov 19, 2020"],
        ["Task" : "Book a flight for my mom", "Due" : "Friday, Nov 20, 2020"],
        ["Task" : "Buy a new microwave", "Due" : "Friday, Nov 20, 2020"],
        ["Task" : "Schedule a haircut", "Due" : "Friday, Nov 20, 2020"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(TasksCellTableViewCell.self,
                                forCellReuseIdentifier: cellTableIdentifier)
    }

    // MARK: Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellTableIdentifier, for: indexPath)
            as! TasksCellTableViewCell
        
        let rowData = tasks[indexPath.row]
        cell.task = rowData["Task"]!
        cell.due = rowData["Due"]!
        
        cell.taskLabel.font = UIFont.boldSystemFont(ofSize: 14)
        cell.dueLabel.font = UIFont.boldSystemFont(ofSize: 10)

        return cell
    }




}

