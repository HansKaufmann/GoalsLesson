//
//  PrimaryUIButton.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 27.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class PrimaryUIButton: UIButton {
    
    
    override init(frame: CGRect){
        super.init(frame: frame)

        self.create()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.create()
    }
    
    func create() {
        self.layer.cornerRadius = 20
        self.layer.borderColor = UIColor(red: 0.0, green: 150.0 / 255.0, blue: 136.0 / 255.0, alpha: 1.0).cgColor
        self.layer.borderWidth = 1
        self.contentEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15)
    }

    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
