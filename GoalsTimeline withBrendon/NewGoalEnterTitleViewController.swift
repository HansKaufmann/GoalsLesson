//
//  NewGoalEnterTitleViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class NewGoalEnterTitleViewController: BaseViewController, UITextViewDelegate {
    
    @IBOutlet weak var titleField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // if retur key is tapped. \n = newline character
        if text == "\n" {
            // blur focus on the textfield - dissmissing the keyboard
            textView.resignFirstResponder()
            
            // remove the current view from the navigationController's stack of views. Aka go back
            _ = self.navigationController?.popViewController(animated: true)
            
            // Post notification that title has changed
            let notificationName = Notification.Name(NEW_GOAL.TITLE_NOTIFICATION)
            let data: [String: String] = ["title": textView.text]
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: data)

            
            // do not update text field with new character from keyboard
            return false;
        }
        
        // update text field with new character from keyboard
        return true;
    }
}
