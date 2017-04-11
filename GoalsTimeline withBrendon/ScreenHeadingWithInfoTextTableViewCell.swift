//
//  ScreenHeadingWithInfoTextTableViewCell.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 27.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class ScreenHeadingWithInfoTextTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var infoText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
