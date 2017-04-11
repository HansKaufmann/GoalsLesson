//
//  DatabaseManager.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 11.04.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import Foundation
import FirebaseDatabase

class DataBaseManager {
    
    var ref: FIRDatabaseReference! = FIRDatabase.database().reference()
    
    func saveGoal(goalParameters: NewGoalModel) {
        let goalsRef = self.ref.child("Goals").childByAutoId()
        
        let goalDict: [String: Any] = [
            "title":goalParameters.title,
            "type":goalParameters.type,
            "startDate":goalParameters.startDate,
            "creationDate":goalParameters.creationDate,
            "actions":goalParameters.actions
        ]
        
        goalsRef.setValue(goalDict)
    }
    
}
