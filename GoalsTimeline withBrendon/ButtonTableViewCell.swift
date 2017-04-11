//
//  ButtonTableViewCell.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 28.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var createNewGoalButton: PrimaryUIButton!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
