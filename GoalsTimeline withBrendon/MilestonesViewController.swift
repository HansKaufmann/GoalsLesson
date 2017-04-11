//
//  MilestonesViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 23.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class MilestonesViewController: BaseViewController {

    @IBOutlet weak var typeRepetitive: RadioButton!
    @IBOutlet weak var typeDeadline: RadioButton!
    @IBOutlet weak var durationInWeeks: UILabel!
    @IBOutlet weak var actionsPerWeek: UILabel!
    
    
    var goalType = 0
    var duration = 3
    var actions = 3
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.typeRepetitive.buttonIndex = 0
        self.typeDeadline.buttonIndex = 1
        
        self.selectRadio(index: goalType)
        
        self.durationInWeeks.text = String(duration)
        self.actionsPerWeek.text = String(actions)
        
    }
    
    
    // MARK: Radio Buttons
    
    @IBAction func didTapRepetitive(_ sender: Any) {
        if self.goalType != self.typeRepetitive.buttonIndex
        {
            self.selectRadio(index: self.typeRepetitive.buttonIndex!)
        }
    }
    
    @IBAction func didTapDeadline(_ sender: Any)
    {
        if self.goalType != self.typeDeadline.buttonIndex
        {
            self.selectRadio(index: self.typeDeadline.buttonIndex!)
        }
    }
    
    func selectRadio(index: Int)
    {
        
        if index == self.typeRepetitive.buttonIndex
        {
            self.typeRepetitive.isSelected = true
        }
        else
        {
            self.typeRepetitive.isSelected = false
        }
        
        
        if index == self.typeDeadline.buttonIndex
        {
            self.typeDeadline.isSelected = true
        }
        else
        {
            self.typeDeadline.isSelected = false
        }
        
        
        self.goalType = index
        
        // Post notification that title has changed
        let notificationName = Notification.Name(NEW_GOAL.TYPE_NOTIFICATION)
        let data: [String: String] = ["type": String(self.goalType)]
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: data)
    }
    
    // MARK: Duration in Weeks
    @IBAction func decreasedDuration(_ sender: UIButton) {
        if duration > 1 {
            duration -= 1
            self.durationInWeeks.text = String(duration)
        }
        
    }
    

    @IBAction func increasedDuration(_ sender: UIButton) {
        if duration < 30 {
            duration += 1
            self.durationInWeeks.text = String(duration)
        }
    }
    
    // MARK: Actions per week
    @IBAction func decreasedActions(_ sender: UIButton) {
        if actions > 1 {
            actions -= 1
            self.actionsPerWeek.text = String(actions)
        }
    }
    @IBAction func increasedActions(_ sender: UIButton) {
        if actions < 14 {
            actions += 1
            self.actionsPerWeek.text = String(actions)
        }
    }
    
    @IBAction func saveTimeline(_ sender: PrimaryUIButton) {
        
        // Post notification that duration has changed
        let durationNotification = Notification.Name(NEW_GOAL.DURATION_NOTIFICATION)
        let durationData: [String: String] = ["duration": String(self.duration)]
        NotificationCenter.default.post(name: durationNotification, object: nil, userInfo: durationData)
        
        // Post notification that duration has changed
        let actionNotification = Notification.Name(NEW_GOAL.ACTIONS_NOTIFICATION)
        let actionData: [String: String] = ["actions": String(self.actions)]
        NotificationCenter.default.post(name: actionNotification, object: nil, userInfo: actionData)


    }
    
    
    
}
