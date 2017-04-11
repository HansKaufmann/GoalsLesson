//
//  NewGoalModel.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 10.04.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class NewGoalModel {
    
    
    //MARK: Properties
    
    var title: String
    var actions: [Any]
    var type: Int
    var mentorID: String
    var meID: String
    var creationDate: Double
    var startDate: Double
    var stake: String
    
    init(){
        self.creationDate = NSDate().timeIntervalSince1970
        self.title = ""
        self.actions = []
        self.type = 0
        self.mentorID = ""
        self.meID = ""
        self.startDate = NSDate().timeIntervalSince1970
        self.stake = ""
    }
    
    
    //MARK: Initialization
    
//    init?(title: String, actions: [Any], type: Int, mentorID: String, meID: String, startDate: Double?) {
//        
//        
//        // We want initialization to fail in case there is no name or a negative number of actions.
//        if title.isEmpty || actions.count < 0 {
//            return nil
//        }
//        
//        // Initalize stored properties
//        self.title = title
//        self.actions = actions
//        self.type = type
//        self.mentorID = mentorID
//        self.meID = meID
//        self.creationDate = NSDate().timeIntervalSince1970
//        
//        if startDate == nil {
//            self.startDate = self.creationDate
//        } else {
//            self.startDate = startDate!
//        }
//
//        
//    }
    
}



