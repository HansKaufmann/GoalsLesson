//
//  NewGoalStakeViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class NewGoalStakeViewController: UIViewController, UITextViewDelegate {
    

    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            // blur focus on the textfield - dissmissing th keyboard
            textView.resignFirstResponder()
            
            // remove the current view from the navigactioncontroller's stack of views. Aka go back
            _ = self.navigationController?.popViewController(animated: true)
            
            let notificationName = Notification.Name(Constants.stake)
            let data: [String: String] = ["title": textView.text]
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: data)

            return false;
        }
        
        // update text field with new character from keyboard
        return true;

    }
    


}
