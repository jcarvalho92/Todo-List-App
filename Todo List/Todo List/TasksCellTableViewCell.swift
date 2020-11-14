//
//  TasksCellTableViewCell.swift
//  Todo List
//
//  Created by Juliana de Carvalho on 2020-11-14.
//  Copyright © 2020 Juliana de Carvalho. All rights reserved.
//  Student Id: 30113760
//  Version 1.0
//  Build 1

import UIKit

class TasksCellTableViewCell: UITableViewCell {


    var taskLabel: UILabel!
    var dueLabel: UILabel!
    var forwardButton: UIButton!
    var unCheckedButton: UIButton!
    var checkedButton: UIButton!

    
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier )

         let taskLabelRect = CGRect(x: 0, y: 5, width: 70, height: 15)
         let taskMarker = UILabel(frame: taskLabelRect)
         taskMarker.textAlignment = NSTextAlignment.right
         //The table view cell already has a UIView subview called contentView, which it uses to group all of its subviews.
         contentView.addSubview(taskMarker)

         let dueLabelRect = CGRect(x: 0, y: 26, width: 70, height: 15)
         let dueMarker = UILabel(frame: dueLabelRect)
         dueMarker.textAlignment = NSTextAlignment.right
         contentView.addSubview(dueMarker)
        
        let unCheckedImage = UIImage(named: "UnChecked")
        let unCheckedButtonRect = CGRect(x: 300, y: 7, width: 46, height: 30)
        let unCheckedMarker = UIButton(frame: unCheckedButtonRect)
        unCheckedMarker.setBackgroundImage(unCheckedImage, for: UIControl.State.normal)
        unCheckedMarker.isPointerInteractionEnabled = true
        contentView.addSubview(unCheckedMarker)
  
        
         let forwardImage = UIImage(named: "Forward")
         let forwardButtonRect = CGRect(x: 335, y: 7, width: 46, height: 30)
         let forwardMarker = UIButton(frame: forwardButtonRect)
         forwardMarker.setBackgroundImage(forwardImage, for: UIControl.State.normal)
         forwardMarker.isPointerInteractionEnabled = true
         contentView.addSubview(forwardMarker)

         let taskValueRect = CGRect(x: 2, y: 5, width: 200, height: 15)
         taskLabel = UILabel(frame: taskValueRect)
         contentView.addSubview(taskLabel)

         let dueValueRect = CGRect(x: 2, y: 25, width: 200, height: 15)
         dueLabel = UILabel(frame: dueValueRect)
         contentView.addSubview(dueLabel)
        
        let unCheckedValueRect = CGRect(x: 300, y: 7, width: 46, height: 30)
        unCheckedButton = UIButton(frame: unCheckedValueRect)
        contentView.addSubview(unCheckedButton)

        let forwardValueRect = CGRect(x: 335, y: 7, width: 46, height: 30)
        forwardButton = UIButton(frame: forwardValueRect)
        contentView.addSubview(forwardButton)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
