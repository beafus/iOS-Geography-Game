//
//  CapitalsViewController.swift
//  geoGame
//
//  Created by Beatriz Fuster Gonzalez on 16/4/15.
//  Copyright (c) 2015 Beatriz Fuster Gonzalez. All rights reserved.
//

import UIKit

class CapitalsViewController: UIViewController {
    
   
    
    var level = "Beginner"
    var continent = "Europe"
    var randomNumber1 = 0
    var randomNumber2 = 0
    var randomNumber3 = 0
    
    var maxNum = 0
    var minNum = 0

    
    var rightAnswer = ""
    var step = 0.0
    
    var mytimer = NSTimer()
    var mytimer2 = NSTimer()
    var seconds = 10
    var stepSeconds = 0

   
    
    @IBOutlet weak var secBar: UIProgressView!
    
    
    @IBOutlet weak var levelLabel: UILabel!
    
    @IBOutlet weak var continentLabel: UILabel!
    
    
    @IBOutlet weak var life1: UIImageView!
    
    @IBOutlet weak var life2: UIImageView!
    
    @IBOutlet weak var life3: UIImageView!
    
    @IBOutlet weak var life4: UIImageView!
    
    @IBOutlet weak var life5: UIImageView!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
   
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1: UIButton!
    
    @IBOutlet weak var option2: UIButton!
    
    @IBOutlet weak var option3: UIButton!
    
    
    
    
    
    @IBAction func option1Action(sender: UIButton) {
        
        var buttonName = option1.titleLabel!.text
        
        if (buttonName == rightAnswer){
            answerRight()
        }else{
            answerWrong()
        }
        
        nextQuestion()
        lifesFunction()
    }
    
    @IBAction func option2Action(sender: UIButton) {
        
        var buttonName = option2.titleLabel!.text
        
         if (buttonName == rightAnswer){
            answerRight()
        }else{
            answerWrong()
        }
        
        nextQuestion()
        lifesFunction()
    }
    
    
    @IBAction func option3Action(sender: UIButton) {
        
        var buttonName = option3.titleLabel!.text
    
         if (buttonName == rightAnswer){
            answerRight()
        }else{
            answerWrong()
        }
        
        nextQuestion()
        lifesFunction()
    }
    
  
    
    var countries: [[String: String]]!
    
    
    var score = 0
    var lifes = 0
    
    
    func intitializeLifes(){
        
        if (level == "Expert"){
            lifes = 2
    
        }
        else if (level == "Advanced"){
            lifes = 3
            
        }else if (level == "Intermediate"){
            lifes = 4
            
        }else{
            lifes = 5
        
        }
    
    }
    
    func lifesFunction(){
        
        if (lifes == 1){
            life1.image = UIImage(named: "red")
            life2.image = UIImage(named: "grey")
            life3.image = UIImage(named: "grey")
            life4.image = UIImage(named: "grey")
            life5.image = UIImage(named: "grey")
            
        }else if (lifes == 2){
            life1.image = UIImage(named: "red")
            life2.image = UIImage(named: "red")
            life3.image = UIImage(named: "grey")
            life4.image = UIImage(named: "grey")
            life5.image = UIImage(named: "grey")
            
        }
        else if (lifes == 3){
            life1.image = UIImage(named: "red")
            life2.image = UIImage(named: "red")
            life3.image = UIImage(named: "red")
            life4.image = UIImage(named: "grey")
            life5.image = UIImage(named: "grey")
            
        }
        else if (lifes == 4){
            life1.image = UIImage(named: "red")
            life2.image = UIImage(named: "red")
            life3.image = UIImage(named: "red")
            life4.image = UIImage(named: "red")
            life5.image = UIImage(named: "grey")
            
        }
        else {
            life1.image = UIImage(named: "red")
            life2.image = UIImage(named: "red")
            life3.image = UIImage(named: "red")
            life4.image = UIImage(named: "red")
            life5.image = UIImage(named: "red")
        
        }
        
        
    
    }
    
    
    func randomNumberFunction(var max:Int , var min:Int) -> Int {
        
        var randomNumber = Int(arc4random_uniform(UInt32(max)))
        return randomNumber
        
    }
    
    
    func nextQuestion(){
        
         mytimer2.invalidate()
          mytimer.invalidate()
         secBar.progress = 0.0
        
        if (score>=50){
            
            seconds = 2
        }
        else if(score>=40 && score<50){
            seconds = 3
        }
        else if(score>=30 && score<40){
             seconds = 4
        }
        else if(score>=20 && score<30){
            seconds = 5
        }
        else if(score>=15 && score<20){
            seconds = 6
        }
        else if(score>=6 && score<15){
            seconds = 8
        }
        else{
         seconds = 11
        }
        
        stepSeconds = seconds
       
        mytimer = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector: Selector("startTimer"),userInfo: nil, repeats:true)
        mytimer2 = NSTimer.scheduledTimerWithTimeInterval(0.1,target:self,selector: Selector("startTimer2"),userInfo: nil, repeats:true)
        
        randomNumber1 = randomNumberFunction(countries.count, min: 0)
        randomNumber2 = randomNumberFunction(countries.count, min: 0)
        randomNumber3 = randomNumberFunction(countries.count, min: 0)
       
        if ((randomNumber1 == randomNumber2)||(randomNumber2 == randomNumber3)||(randomNumber3 == randomNumber1)){
            
            randomNumber1 = randomNumberFunction(maxNum-3, min: 3)
            randomNumber2 = randomNumberFunction(2, min: 0)
            randomNumber3 = randomNumberFunction(maxNum, min: maxNum-2)
        
        }
        
      
        
        let question = countries[randomNumber1]
        questionLabel!.text = question["name"]
        var answerRight = question["capital"]
        
        rightAnswer = question["capital"]!
        
        let country1 = countries[randomNumber2]
        let country2 = countries[randomNumber3]
        
        var answerWrong1 = country1["capital"]
        var answerWrong2 = country2["capital"]
        
        var  randomNumberColocation = randomNumberFunction(3, min: 0)
        
        if (randomNumberColocation == 1){
            option1.setTitle(answerWrong1, forState: UIControlState.Normal)
            option2.setTitle(answerWrong2, forState: UIControlState.Normal)
            option3.setTitle(answerRight, forState: UIControlState.Normal)
        }else if (randomNumberColocation == 2 ){
            option3.setTitle(answerWrong1, forState: UIControlState.Normal)
            option1.setTitle(answerWrong2, forState: UIControlState.Normal)
            option2.setTitle(answerRight, forState: UIControlState.Normal)
            }else{
            option2.setTitle(answerWrong1, forState: UIControlState.Normal)
            option3.setTitle(answerWrong2, forState: UIControlState.Normal)
            option1.setTitle(answerRight, forState: UIControlState.Normal)
        }
        
    }
    
    func endOfGame(){
          self.performSegueWithIdentifier("gameOver", sender: self)
    }
    
   
    func answerRight(){
        
        score = score + 1
        resultLabel.text = "Score:\(score)"
    
    }
    
    func answerWrong(){
        lifes = lifes - 1
        
        if (lifes == 0){
            endOfGame()
        }
        
        
    }
    

    override func viewDidLoad() {
        
    
        super.viewDidLoad()
        
        levelLabel.text = level
        continentLabel.text = continent
        
        resultLabel.text = "Score:\(score)"
        
        if (continent == "Europe"){
            let path = NSBundle.mainBundle().pathForResource("europe", ofType: "plist")!
            let countryInfo = NSDictionary(contentsOfFile: path)!
            countries = countryInfo["countries"]! as! [NSDictionary] as! [[String: String]]
            maxNum = 48
            
            
        }else if (continent == "America"){
             let path = NSBundle.mainBundle().pathForResource("america", ofType: "plist")!
            let countryInfo = NSDictionary(contentsOfFile: path)!
            countries = countryInfo["countries"]! as! [NSDictionary] as! [[String: String]]
            maxNum = 47
            
        }else if (continent == "Asia"){
             let path = NSBundle.mainBundle().pathForResource("asia", ofType: "plist")!
            let countryInfo = NSDictionary(contentsOfFile: path)!
            countries = countryInfo["countries"]! as! [NSDictionary] as! [[String: String]]
            maxNum = 42
            
        }else if (continent == "Africa"){
             let path = NSBundle.mainBundle().pathForResource("africa", ofType: "plist")!
            let countryInfo = NSDictionary(contentsOfFile: path)!
            countries = countryInfo["countries"]! as! [NSDictionary] as! [[String: String]]
            maxNum = 53
            
        }else{
             let path = NSBundle.mainBundle().pathForResource("oceania", ofType: "plist")!
            let countryInfo = NSDictionary(contentsOfFile: path)!
            countries = countryInfo["countries"]! as! [NSDictionary] as! [[String: String]]
            maxNum = 13
            
        }
        
        intitializeLifes()
        lifesFunction()
        nextQuestion()
        
      
    }




    func startTimer(){
    
        seconds--
    
        if(seconds == 0){
            timeOut()
        }
    
    }
    
    

    func startTimer2(){
        
        if (stepSeconds==2){
            
            secBar.progress += 0.05
            
        }
        else if (stepSeconds==3){
            secBar.progress += 0.0333
            
        }
        else if (stepSeconds==4){
            secBar.progress += 0.025
            
        }
        else if (stepSeconds==5){
            secBar.progress += 0.02
            
            
        } else if (stepSeconds==6){
            secBar.progress += 0.0166
            
        }
        else if (stepSeconds==8){
            secBar.progress += 0.0125
            
        }
        else {
            secBar.progress += 0.009
            
        }

        if(seconds == 0){
            
            secBar.progress = 1.0
            
            timeOut()
            
        }
        
    }


    func timeOut(){
    
        secBar.progress = 0.0
    
        mytimer.invalidate()
        mytimer2.invalidate()
        answerWrong()
   
        nextQuestion()
        lifesFunction()
    
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "gameOver") {
            
            var svc = segue.destinationViewController as! GameOverViewController;
            svc.lastScore = score
        
            
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
