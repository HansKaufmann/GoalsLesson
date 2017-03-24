//
//  NewGoalInspirationViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class NewGoalInspirationViewController: BaseViewController {


    @IBOutlet weak var createAGoalButton: UIButton!
    
    @IBOutlet weak var heading: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //heading.font = UIFont(name: "Lato-Black", size: 48.0)//UIFont.glsSketchTitleFont()
        
        createAGoalButton.layer.cornerRadius = 20
        createAGoalButton.layer.borderColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 136.0 / 255.0, alpha: 1.0).cgColor
        createAGoalButton.layer.borderWidth = 1
        createAGoalButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
