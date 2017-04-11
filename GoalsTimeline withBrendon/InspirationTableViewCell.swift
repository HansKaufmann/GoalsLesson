//
//  InspirationTableViewCell.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 27.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit

class InspirationTableViewCell: UITableViewCell { }
    
extension InspirationTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirationDataPopularGoals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "inspirationGoalCollectionCell", for: indexPath) as! InspirationGoalCollectionViewCell
        
        cell.goalTitleCollectionView.text = inspirationDataPopularGoals[indexPath.item]["titleIG"] as! String!
        
        cell.goalImageCollectionView.sd_setImage(with: URL(string: (inspirationDataPopularGoals[indexPath.item]["url"] as? String)!))
        
        return cell

    }
    
}

