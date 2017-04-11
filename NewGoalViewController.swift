//
//  NewGoalViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 23.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

// This class promises to adhere to the NewGoalViewDelegate protocol
// By promise meaning it wont compile unless it does
class NewGoalViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    var titles = ["Type your goal","Milestones","Mentor","Stake","Friendsfeed","Save"]
    var subtitles = ["","Lorem1","Lorem1","Lorem1","Lorem1"]
    var selectedCellIndex: Int = -1
    var newGoalModel: NewGoalModel?
    var actions = 3
    var duration = 3
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newGoalModel =  NewGoalModel()

        let titleNotification = Notification.Name(NEW_GOAL.TITLE_NOTIFICATION)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTitle), name: titleNotification, object: nil)
        
        let stakeNotification = Notification.Name(NEW_GOAL.STAKE_NOTIFICATION)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateStake), name: stakeNotification, object: nil)
        
        let typeNotification = Notification.Name(NEW_GOAL.TYPE_NOTIFICATION)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateType), name: typeNotification, object: nil)
        
        let durationNotification = Notification.Name(NEW_GOAL.DURATION_NOTIFICATION)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateDuration), name: durationNotification, object: nil)
        
        let actionsNotification = Notification.Name(NEW_GOAL.ACTIONS_NOTIFICATION)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateActions), name: actionsNotification, object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }
        if indexPath.row == titles.count - 1 {
            return 70
        }
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row <= 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! NewGoalTitleTableViewCell
            cell.title.text = titles[indexPath.row]
            return cell
        }
        
        if indexPath.row == titles.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newGoalSaveCell", for: indexPath) as! NewGoalSaveTableViewCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "otherCell", for: indexPath) as! NewGoalTableViewCell
        cell.title.text = titles[indexPath.row]
        cell.subtitle.text = subtitles[indexPath.row]
        return cell
        

    }
    
    // handles when the user clicks on a table cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedCellIndex = indexPath.row
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "new_goal_segue", sender: self)
        case 1:
            self.performSegue(withIdentifier: "milestones_segue", sender: self)
        case 2:
            self.performSegue(withIdentifier: "mentor_segue", sender: self)
        case 3:
            self.performSegue(withIdentifier: "stake_segue", sender: self)
        case 4:
            self.performSegue(withIdentifier: "friends_feed_segue", sender: self)
            
        default:
            NSLog("No segue for this cell")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // this is where you can set the values of the view from the model
        
//        if segue.identifier == "new_goal_segue" {
//            let vc = segue.destination as! NewGoalEnterTitleViewController
//            vc.titleField.text = "sdf"
//        }
    }
    
    
    // this is called when we received a notification that the goal's title changed on the other view
    func updateTitle(_ notification: NSNotification) {
        // get new value
        let title = notification.userInfo?["title"] as! String
        
        // log the new value
        NSLog(title)
        
        // update the array of cell titles with the new goalTitle value
        titles[selectedCellIndex] = title
        
        // find the correct cell to reload
        let indexPath = IndexPath(item: selectedCellIndex, section: 0)
        
        // reload that cell with the now updated titles array
        tableView.reloadRows(at: [indexPath], with: .none)
        
        // save the new goalTitle in our data model
        self.newGoalModel?.title = title
        
    }
    
    // this is called when we received a notification that the stake changed on the other view
    func updateStake(_ notification: NSNotification) {
        // get new value
        let stake = notification.userInfo?["stake"] as! String
        
        // log the new value
        NSLog(stake)
        
        // update the array of cell subtitles with the new stake value
        subtitles[selectedCellIndex] = stake
        
        // find the correct cell to reload
        let indexPath = IndexPath(item: selectedCellIndex, section: 0)
        
        // reload that cell with the now updated subtitles array
        tableView.reloadRows(at: [indexPath], with: .none)
        
        // save the new stake in our data model
        self.newGoalModel?.stake = stake
        
    }
    
    func updateType(_ notification: NSNotification){
        
        // get value from notification data
        let typeString = notification.userInfo?["type"] as! String

        // log the new value
        NSLog(typeString)
        
        // convert string to int
        let type: Int? = Int(typeString)
        
        // save the new type in our data model
        self.newGoalModel?.type = type!
    }
    
    func updateDuration(_ notification: NSNotification) {
        
        // get value from notification data
        let durationString = notification.userInfo?["duration"] as! String
        
        // log the new value
        NSLog(durationString)
        
        // save string to int to var
        self.duration = Int(durationString)!
        

        
    }
    
    func updateActions(_ notification: NSNotification) {
        
        // get value from notification data
        let actionsString = notification.userInfo?["actions"] as! String
        
        // log the new value
        NSLog(actionsString)
        
        // convert string to int save to var
        self.actions = Int(actionsString)!

    }
    
    @IBAction func saveGoal(_ sender: PrimaryUIButton) {
        
        var temp = [Int]()
        var i = 0
        while i < duration {
            temp.append(actions)
            i += 1
        }
        
        self.newGoalModel?.actions = temp
        
        print(self.newGoalModel!)
        
        let dataBaseManager = DataBaseManager()
        dataBaseManager.saveGoal(goalParameters: self.newGoalModel!)
        
    }
    

}
