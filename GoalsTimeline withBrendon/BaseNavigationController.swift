//
//  BaseNavigationController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.backgroundColor = UIColor(white: 1, alpha: 0.97)
        
        
        var backArrow = UIImage(named: "arrowLeftSimpleLineIcons")
        
        let topPadding: CGFloat = 4
        let leftPadding: CGFloat = 22
        
        let adjustSizeForBetterHorizontalAlignment: CGSize = CGSize(width: backArrow!.size.width + leftPadding, height: backArrow!.size.height + topPadding)
        
        UIGraphicsBeginImageContextWithOptions(adjustSizeForBetterHorizontalAlignment, false, 0)
        backArrow?.draw(at: CGPoint(x: leftPadding, y: topPadding))
        backArrow = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.navigationBar.backIndicatorImage = backArrow
        self.navigationBar.backIndicatorTransitionMaskImage = backArrow

    }
}
