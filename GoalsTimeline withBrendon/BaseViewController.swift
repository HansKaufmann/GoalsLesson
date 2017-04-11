//
//  BaseViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem?.title = ""
        self.navigationItem.title = ""

        
        
    }

}
