//
//  TasksCellTableViewCell.swift
//  Todo List
//
//  Created by Juliana de Carvalho on 2020-11-14.
//  Copyright © 2020 Juliana de Carvalho. All rights reserved.
//  Student Id: 30113760


import UIKit

class TasksCellTableViewCell: UITableViewCell {

    var taskLabel: UILabel!
    var dueLabel: UILabel!
    var forwardButton: UIButton!
    var unCheckedButton: UIButton!

    var task: String = "" {
        didSet {
            if (task != oldValue) {
                taskLabel.text = task
            }
        }
    }
    var due: String = "" {
        didSet {
            if (due != oldValue) {
                dueLabel.text = due
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //creating the tableviewCell structure
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier )

         let taskLabelRect = CGRect(x: 20, y: 5, width: 70, height: 15)
         let taskMarker = UILabel(frame: taskLabelRect)
         taskMarker.textAlignment = NSTextAlignment.right
         contentView.addSubview(taskMarker)

         let dueLabelRect = CGRect(x: 20, y: 26, width: 70, height: 15)
         let dueMarker = UILabel(frame: dueLabelRect)
         dueMarker.textAlignment = NSTextAlignment.right
         contentView.addSubview(dueMarker)
        
        let unCheckedImage = UIImage(named: "UnChecked")
        let unCheckedButtonRect = CGRect(x: 340, y: 7, width: 30, height: 30)
        let unCheckedMarker = UIButton(frame: unCheckedButtonRect)
        unCheckedMarker.setBackgroundImage(unCheckedImage, for: UIControl.State.normal)
        unCheckedMarker.isPointerInteractionEnabled = true
        contentView.addSubview(unCheckedMarker)
        
         let forwardImage = UIImage(named: "Forward")
         let forwardButtonRect = CGRect(x: 370, y: 7, width: 30, height: 30)
         let forwardMarker = UIButton(frame: forwardButtonRect)
         forwardMarker.setBackgroundImage(forwardImage, for: UIControl.State.normal)
         forwardMarker.isPointerInteractionEnabled = true
         contentView.addSubview(forwardMarker)

         let taskValueRect = CGRect(x: 20, y: 5, width: 200, height: 15)
         taskLabel = UILabel(frame: taskValueRect)
         contentView.addSubview(taskLabel)

         let dueValueRect = CGRect(x: 20, y: 26, width: 200, height: 15)
         dueLabel = UILabel(frame: dueValueRect)
         contentView.addSubview(dueLabel)
        
        let unCheckedValueRect = CGRect(x: 340, y: 7, width: 30, height: 30)
        unCheckedButton = UIButton(frame: unCheckedValueRect)
        contentView.addSubview(unCheckedButton)

        let forwardValueRect = CGRect(x: 370, y: 7, width: 30, height: 30)
        forwardButton = UIButton(frame: forwardValueRect)
        contentView.addSubview(forwardButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
