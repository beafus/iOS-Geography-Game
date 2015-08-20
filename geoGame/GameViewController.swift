//
//  GameViewController.swift
//  geoGame
//
//  Created by Beatriz Fuster Gonzalez on 16/4/15.
//  Copyright (c) 2015 Beatriz Fuster Gonzalez. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var levelLabelSelected: UILabel!
    
    @IBOutlet weak var continentLabelSelected: UILabel!
    
    
    var levelSelected = ""
    var continentSelected = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelLabelSelected.text = levelSelected
        continentLabelSelected.text = continentSelected

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "goToCapitals") {
            
            var svc1 = segue.destinationViewController as! CapitalsViewController;
            
            svc1.level = levelSelected
            svc1.continent = continentSelected
            
            
        }

        
        else if (segue.identifier == "goToFlags") {
            
            var svc2 = segue.destinationViewController as! FlagsViewController;
            
            svc2.level = levelSelected
            svc2.continent = continentSelected
            
            
        }

        
        else if (segue.identifier == "goToMaps") {

            var svc3 = segue.destinationViewController as! MapsViewController;
            
            svc3.level = levelSelected
            svc3.continent = continentSelected
            
            
        }



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
