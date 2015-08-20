//
//  GameOverViewController.swift
//  geoGame
//
//  Created by Beatriz Fuster Gonzalez on 17/4/15.
//  Copyright (c) 2015 Beatriz Fuster Gonzalez. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var lastScore = 0
    var record = 0
    
    @IBOutlet weak var lastScoreLabel: UILabel!
    
    @IBOutlet weak var recordLabel: UILabel!
    
    @IBOutlet weak var winnerImage: UIImageView!
    
    func checkScore(){
        
     
        
        if (lastScore > record){
              record = lastScore
            
            winnerImage.image = UIImage(named: "winner")
            
            
        }
        
     
        lastScoreLabel.text = "\(lastScore)"
        recordLabel.text = "\(record)"
        
        
    
    
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkScore()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
