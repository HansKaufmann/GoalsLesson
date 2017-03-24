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
class NewGoalViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, NewGoalViewDelegate  {

    @IBOutlet weak var tableView: UITableView!
    var titles = ["Type your goal","Milestones","Mentor","Stake","Friendsfeed"]
    var subtitles = ["","Lorem1","Lorem1","Lorem1","Lorem1"]
    var selectedCellIndex: Int = -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name(Constants.stake)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateStake), name: notificationName, object: nil)
        
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
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row <= 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! NewGoalTitleTableViewCell
            cell.title.text = titles[indexPath.row]
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherCell", for: indexPath) as! NewGoalTableViewCell
            cell.title.text = titles[indexPath.row]
            cell.subtitle.text = subtitles[indexPath.row]
            return cell
        }

    }
    
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
            NSLog("No segue fpr this cell")
        }
        
        
    }
    
    // before pushing a new view
    // we assign this class as the delegate for that view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "new_goal_segue" {
            let destination = segue.destination as! NewGoalEnterTitleViewController
            
            // Here we become the coffeeshop until someone else is
            destination.delegate = self;
        }
        

    }
    
    
    // This is what we promised to do
    //
    // This is called by the page that delegated us this task
    func viewDataDidChange(title: String) {
        NSLog(title as String)
        titles[selectedCellIndex] = title
        
        let indexPath = IndexPath(item: selectedCellIndex, section: 0)
        tableView.reloadRows(at: [indexPath], with: .top)
    }
    
    func updateStake(_ notification: NSNotification) {
        let title = notification.userInfo?["title"] as! String
        NSLog(title)
        
        subtitles[selectedCellIndex] = title
        
        let indexPath = IndexPath(item: selectedCellIndex, section: 0)
        tableView.reloadRows(at: [indexPath], with: .top)
        
    }

}
