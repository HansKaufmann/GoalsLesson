//
//  MentoringViewController.swift
//  GoalsTimeline withBrendon
//
//  Created by hans kaufmann on 27.03.17.
//  Copyright © 2017 hans kaufmann. All rights reserved.
//

import UIKit
import Firebase

class MentoringViewController: UIViewController {

    @IBOutlet weak var imageTest: UIImageView!
    
 //   var storageRef: FIRStorageReference
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let storageRef = FIRStorage.storage().reference(withPath: "inspirationGoals/runIG.png")
        //let url = "https://firebasestorage.googleapis.com/v0/b/goals-with-brendon.appspot.com/o/inspirationGoals%2FrunIG.png?alt=media&token=bc12a241-0506-4fb7-8779-4f1309739dce"
        
        
        imageTest.sd_setImage(with: URL(string: (inspirationDataPopularGoals[2]["url"] as? String)!))
        
        
        //imageTest.sd_setImage(with: URL(string: "https://firebasestorage.googleapis.com/v0/b/goals-with-brendon.appspot.com/o/inspirationGoals%2FrunIG.png?alt=media&token=bc12a241-0506-4fb7-8779-4f1309739dce"))
        

        
        
            
        }
        
    
    

        
        
        
        
//        let reference: FIRStorageReference = "inspirationGoals/runIG.png"
//        var imageTest: UIImageView = ...
//            imageView.sd_setImageWithSTorageReference(reference, placeholderImage: placeholderImage))
        
        
        
        
        
        
        //        let placeholderImage = UIImage(named: "whatever")
        //        let url = "the url from firebase"
        //        cell.goalImage.sd_setImage(with: URL, placeholderImage: placeholderImage)
        
        

    



}
