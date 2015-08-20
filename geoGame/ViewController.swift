//
//  ViewController.swift
//  geoGame
//
//  Created by Beatriz Fuster Gonzalez on 16/4/15.
//  Copyright (c) 2015 Beatriz Fuster Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {

    @IBOutlet weak var levelPicker: UIPickerView!
    
    @IBOutlet weak var continentPicker: UIPickerView!
    
    
    @IBOutlet weak var levelLabel: UILabel!
    
    
    @IBOutlet weak var continentLabel: UILabel!
    
    
    let level = ["Begginer","Intermediate","Advanced","Expert"]
    
    let continent = ["Europe", "America", "Asia", "Africa", "Oceania"]
    
    var levelPicked = "Begginer"
    var continentPicked = "Europe"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        levelLabel.text = "Begginer"
        continentLabel.text = "Europe"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    //data source for LEVEL
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    
    
    
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if(pickerView == levelPicker){
            
            return level.count
        }
        else{
            return continent.count
            
        }
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        
        if(pickerView == levelPicker){
            return level[row]
            
        }else{
            return continent[row]
            
        }
        
        
    }
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == levelPicker){
            levelPicked = level[row]
            levelLabel.text = level[row]
            
        }else{
            continentPicked = continent[row]
            continentLabel.text = continent[row]
        }
        
    }
    
    
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "goToGame") {
            
            var svc = segue.destinationViewController as! GameViewController;
            svc.levelSelected = levelPicked
            svc.continentSelected = continentPicked
            
            
        }
    }
    

}

