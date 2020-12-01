//
//  ViewController.swift
//  Todo List
//
//  Created by Juliana de Carvalho on 2020-11-13.
//  Copyright © 2020 Juliana de Carvalho. All rights reserved.
//  Student Id: 30113760



import UIKit

class ViewController: UIViewController , UITableViewDataSource  {

    @IBOutlet var listName: UITextField!
    @IBOutlet var taskDescription: UITextField!
    @IBOutlet var tableView:UITableView!
    let cellTableIdentifier = "CellTableIdentifier"
    var checked = false
    let  checkedImage = UIImage(named: "Checked")
    
    var db: DBHelper = DBHelper()
    
    var todo:[Todo] = []
    var selectedTask = Todo()

    @IBAction func addTask(_ sender: UIButton) {
        //inserting the new task in the database
        db.insert(listName: listName.text! , task: taskDescription.text!)
        
        todo = db.read()
        //displaying a new row with the new task in the tableview
        let selectedIndexPath = IndexPath(row: todo.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [selectedIndexPath], with: .automatic)
        tableView.endUpdates()
        //cleaning the text field
        taskDescription.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TasksCellTableViewCell.self,
                                forCellReuseIdentifier: cellTableIdentifier)
        
        todo = db.read()
        
        if (todo.count > 0){
          listName.text = todo[0].listName
        }
        
    }

    // MARK: Table View Data Source Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellTableIdentifier, for: indexPath)
            as! TasksCellTableViewCell

        cell.task = todo[indexPath.row].task
        cell.due = todo[indexPath.row].due
        
        cell.taskLabel.font = UIFont.boldSystemFont(ofSize: 14)
        cell.dueLabel.font = UIFont.boldSystemFont(ofSize: 10)
        
        //if due date is less than today it changes the due date label to red
        let dueDateString = todo[indexPath.row].due
        if (dueDateString != ""){
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            let dueDate = formatter.date(from: dueDateString)
            //getting todays date
            let today = Date()
            if dueDate! < today {
               cell.dueLabel.textColor = UIColor.red
            }
        }
        
        if (todo[indexPath.row].status == "Completed"){
            //if the task is completed it changes the button backhground to display the checked icon
            cell.unCheckedButton.setBackgroundImage(checkedImage, for: UIControl.State.normal)
            
            //if the task is completed it cross the text
            cell.taskLabel.attributedText = strikeThroughText(text: todo[indexPath.row].task)
           
            //reseting the text color to black again in case it was red before
            cell.dueLabel.textColor = UIColor.black
            
            cell.due = "Completed"
        }
        //when clicking on the button with an arrow icon it calls the function buttonAction
        cell.forwardButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath.row == 0 ? nil : indexPath
    }
    
    @objc func buttonAction(_ sender:UIButton!) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //ref to DetailsViewController
        guard let destinationViewController = mainStoryboard.instantiateViewController(withIdentifier: "DestinationViewController") as? DetailsViewController else {
            print("couldn't find the view controller")
            return
        }
        //getting the index from the button that was selected
        let buttonPosition:CGPoint = sender.convert(CGPoint.zero, to:self.tableView)
        let indexPath = self.tableView.indexPathForRow(at: buttonPosition)
        let index = indexPath!.row
        selectedTask = todo[index]
        //passing just the info from the task that is related to the button that was selected
        destinationViewController.tasks = selectedTask
        
        destinationViewController.title = "Details"
        navigationController?.pushViewController(destinationViewController, animated: true)

    }
    //function to cross out the text
    func strikeThroughText(text: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        
        return attributeString
    }

}

