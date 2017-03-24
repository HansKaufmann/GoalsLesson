//
//  NewGoalEnterTitleViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

// What any class must adhere to in order to be our delegate
protocol NewGoalViewDelegate {
    // this is required by the compiler
    func viewDataDidChange(title: String)
}

class NewGoalEnterTitleViewController: BaseViewController, UITextViewDelegate {

    @IBOutlet weak var titleField: UITextView!
    
    // a place holder variable for what will become our class to delegate to
    // it must adhere to the protocol above
    var delegate: NewGoalViewDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // if retur key is tapped. \n = newline character
        if text == "\n" {
            // blur focus on the textfield - dissmissing th keyboard
            textView.resignFirstResponder()
            
            // remove the current view from the navigactioncontroller's stack of views. Aka go back
            _ = self.navigationController?.popViewController(animated: true)
            
            // if we have a class to delegate to
            if delegate != nil {
                // delegate the task viewDataDidChange to the class
                delegate.viewDataDidChange(title: textView.text)
            }
            

            
            // do not update text field with new character from keyboard
            return false;
        }
        
        // update text field with new character from keyboard
        return true;
    }
}


//            let indexOfSecondLastViewController = (self.navigationController?.viewControllers.count)! - 2
//            let prevView = self.navigationController?.viewControllers[indexOfSecondLastViewController] as! NewGoalViewController
//            prevView.viewDataDidChange(title: textView.text)
