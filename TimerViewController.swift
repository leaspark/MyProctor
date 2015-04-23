//
//  TimerViewController.swift
//  SATTimer
//
//  Created by Lea Sparkman on 4/14/15.
//  Copyright (c) 2015 CompSci. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    var names = [[String]]()
    @IBOutlet var sectionLabel: UILabel!
    @IBOutlet var moveToScoringLabel: UILabel!
    var seconds = 0
    var timer = NSTimer()
    var sectionNumber = 1
    
    var twentyFive: [Int] = [1, 2, 3, 5, 6, 7]
    var breakTime: [Int] = [4, 8]
    var twenty: [Int] = [9, 10]

    
    @IBAction func buttonPressed()  {
       setupGame()
        NSLog("Button Pressed")
        
   }

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupGame()  {
        //10-minute sections
        if(sectionNumber == 11){
            seconds = 10
        }
        //20-minute sections
        else if(sectionNumber == 9 || sectionNumber == 10){
            seconds = 20
        }
        //Breaks (5 minutes)
        else if(sectionNumber == 4 || sectionNumber == 8) {
            seconds = 5
        }
        //25-minute sections
        else {
            seconds = 25
        }
        if(sectionNumber == 1){
            sectionLabel.text = "Section 1"
        }
        else if(sectionNumber == 2){
            sectionLabel.text = "Section 2"
        }
        else if(sectionNumber == 3){
            sectionLabel.text = "Section 3"
        }
        else if(sectionNumber == 4){
            sectionLabel.text = "Break!"
        }
        else if(sectionNumber == 5){
            sectionLabel.text = "Section 4"
        }
        else if(sectionNumber == 6){
            sectionLabel.text = "Section 5"
        }
        else if(sectionNumber == 7){
            sectionLabel.text = "Section 6"
        }
        else if(sectionNumber == 8){
            sectionLabel.text = "Break!"
        }
        else if(sectionNumber == 9){
            sectionLabel.text = "Section 7"
        }
        else if(sectionNumber == 10){
            sectionLabel.text = "Section 8"
        }
        else if(sectionNumber == 11){
            sectionLabel.text = "Section 9"
        }
        timerLabel.text = "\(seconds)"
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("subtractTime"), userInfo: nil, repeats: true)
    }
    
    func moveToScore(){
        moveToScoringLabel.text = "Save My Scores"
        timerLabel.text = "DONE!"
    }

    func subtractTime() {
        seconds--
        timerLabel.text = "\(seconds)"
        
        if(seconds == 0 && sectionNumber == 11){
            timer.invalidate()
            let alertController = UIAlertController(title: "DONE! ", message: "Please input your score:", preferredStyle: .Alert)
            
            let confirmAction = UIAlertAction(title: "Submit Score", style: .Default, handler: {(action) in
                    let mathScore =
                    (alertController.textFields?[0] as! UITextField).text
                    let readingScore =
                    (alertController.textFields?[1] as! UITextField).text
                    let writingScore = (alertController.textFields?[2] as! UITextField).text
                    
                    // ensure query and tag are not empty
                    /*if !mathScore.isEmpty && !readingScore.isEmpty && !writingScore.isEmpty{
                        self.model.saveQuery(
                            mathScore, forTag: tag, syncToCloud: true)
                        
                        if isNew {
                            let indexPath =
                            NSIndexPath(forRow: 0, inSection: 0)
                            self.tableView.insertRowsAtIndexPaths([indexPath],
                                withRowAnimation: .Automatic)
                        }
                    }
                */})
                /*{ (_) in
                if let field = alertController.textFields![0] as? UITextField {
                    // store your data
                    NSUserDefaults.standardUserDefaults().setObject(field.text, forKey: "userEmail")
                    NSUserDefaults.standardUserDefaults().synchronize()
                } else {
                    // user did not fill field
                }
            }*/
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "MATH SCORE"
            }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "WRITING SCORE"
            }
            
            alertController.addTextFieldWithConfigurationHandler { (textField) in
                textField.placeholder = "CRITICAL READING SCORE"
            }
            
            alertController.addAction(confirmAction)
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    
        else if(seconds == 0){
            timer.invalidate()
            let alert = UIAlertController(title: "Time is up!", message: "Take a quick breath and tap to begin the next section.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Start next section", style: UIAlertActionStyle.Default, handler: {
                action in self.setupGame()
            }))
            presentViewController(alert, animated: true, completion:nil)
            sectionNumber += 1
        }
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

