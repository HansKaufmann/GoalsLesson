//
//  NewGoalInspirationViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 24.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit
import SDWebImage

class NewGoalInspirationViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var popularGoalsCollectionView: UICollectionView!
    

//    var items = [#imageLiteral(resourceName: "inspirationHike.JPG"),#imageLiteral(resourceName: "inspirationProjectJPG"), #imageLiteral(resourceName: "inspirationWildnessJPG"), #imageLiteral(resourceName: "inspirationMorningJPG"), #imageLiteral(resourceName: "inspirationParisJPG")]
//    var itemTitles = ["Go for a hike", "Finish a project", "Go to the Wilderness", "Morning Runs", "Go to Paris", "FireImageTest"]

    @IBOutlet weak var createAGoalButton: UIButton!
    
    @IBOutlet weak var suggestAGoalButton: UIButton!
    
    @IBOutlet weak var heading: UILabel!
    
    @IBOutlet weak var infoText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch from firebase here and add it to the EMPTY items array
        
        // Then reload table
        
        
    }
    
    // how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirationDataPopularGoals.count
    }
    //cell for each index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! NewGoalCollectionViewCell
        
        cell.inspirationGoalTitle.text = inspirationDataPopularGoals[indexPath.item]["titleIG"] as! String?
        

        cell.goalImage.sd_setImage(with: URL(string: (inspirationDataPopularGoals[indexPath.item]["url"] as? String)!))
        
        
        
//        let placeholderImage = UIImage(named: "whatever")
//        let url = "the url from firebase"
//        cell.goalImage.sd_setImage(with: URL, placeholderImage: placeholderImage)
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print ("You want to do #\(indexPath.item)")
    }
    

    
}


/*@IBOutlet weak var popularGoalsCollectionView: UICollectionView!


var items = [#imageLiteral(resourceName: "inspirationHike.JPG"),#imageLiteral(resourceName: "inspirationProjectJPG"), #imageLiteral(resourceName: "inspirationWildnessJPG"), #imageLiteral(resourceName: "inspirationMorningJPG"), #imageLiteral(resourceName: "inspirationParisJPG")]
var itemTitles = ["Go for a hike", "Finish a project", "Go to the Wilderness", "Morning Runs", "Go to Paris", "FireImageTest"]

@IBOutlet weak var createAGoalButton: UIButton!

@IBOutlet weak var suggestAGoalButton: UIButton!

@IBOutlet weak var heading: UILabel!

@IBOutlet weak var infoText: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()
    
    // Fetch from firebase here and add it to the EMPTY items array
    
    // Then reload table
    
    
}

// how many cells to make
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.items.count
}
//cell for each index path
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! NewGoalCollectionViewCell
    cell.goalImage.image = items[indexPath.item]
    
    //        let placeholderImage = UIImage(named: "whatever")
    //        let url = "the url from firebase"
    //        cell.goalImage.sd_setImage(with: URL, placeholderImage: placeholderImage)
    
    cell.inspirationGoalTitle.text = itemTitles[indexPath.item]
    return cell
    
}
func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    print ("You want to do #\(indexPath.item)")
}*/



