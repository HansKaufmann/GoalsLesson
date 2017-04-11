//
//  RadioButton.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 29.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    
    var buttonIndex: Int?

    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.create()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.create()
    }
    
    func create() {
        self.setImage(#imageLiteral(resourceName: "circledEmptyButton"), for: .normal)
        self.setImage(#imageLiteral(resourceName: "circledFilledButton"), for: .selected)
    }
    
    func setButtonState(state: Bool) {
        
        if state
        {
            self.isSelected = true
        }
        else
        {
            self.isSelected = false
            
        }
    }

        
    
    
}
