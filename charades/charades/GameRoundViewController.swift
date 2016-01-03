//
//  CharadeViewController.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import UIKit

class GameRoundViewController : UIViewController {
    
    @IBOutlet weak var charadeLabel : UILabel? {
        didSet {
            self.charadeLabel?.text = "Get Ready!"
            self.charadeLabel?.textColor = UIColor.roundCharadeTextColor()
        }
    }

    @IBOutlet weak var correctGuessesLabel : UILabel? {
        didSet {
            self.correctGuessesLabel?.text =
            "\(self.correctGuesses) / \(self.count)"
            
            self.correctGuessesLabel?.textColor =
                UIColor.roundStatusTextColor()
        }
    }
 
    @IBOutlet weak var roundTimerLabel : UILabel? {
        didSet {
            self.roundTimerLabel?.textColor =
                UIColor.roundStatusTextColor()
        }
    }
    
    @IBOutlet weak var nextButton : UIButton? {
        didSet {
            nextButton?.setTitleColor(UIColor.lightTextColor(), forState: .Normal)
            nextButton?.backgroundColor = UIColor.buttonBackgroundColor()
            
            nextButton?.layer.shadowColor = UIColor.shadowColor().CGColor
            nextButton?.layer.shadowOffset = CGSizeMake(0, 3)
            nextButton?.layer.shadowOpacity = 0.5
        }
    }

    @IBOutlet weak var jumpButton : UIButton? {
        didSet {
            jumpButton?.setTitleColor(UIColor.lightTextColor(), forState: .Normal)
            jumpButton?.backgroundColor = UIColor.buttonBackgroundColor()
            
            jumpButton?.layer.shadowColor = UIColor.shadowColor().CGColor
            jumpButton?.layer.shadowOffset = CGSizeMake(0, 3)
            jumpButton?.layer.shadowOpacity = 0.5
        }
    }

    var count : Int = 0 {
        didSet {
            if (count == 0) {
                return
            }
            self.charadeLabel?.text = "Charade \(self.count)"
            self.correctGuessesLabel?.text =
            "\(self.correctGuesses) / \(self.count)"
        }
    }
    
    var correctGuesses = 0 {
        didSet {
            self.correctGuessesLabel?.text =
            "\(self.correctGuesses) / \(self.count)"
        }
    }
    
    @IBAction func skipToNext() {
        self.count += 1
        self.charadeLabel?.text = "Charade \(self.count)"
    }
    
    @IBAction func correctGuesse() {
        self.correctGuesses++
        self.skipToNext()
    }
    
    var initialTimer : NSTimer?
    var roundTimer : NSTimer?
    var counter = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = UIColor.roundBackgroundColor()
        self.startInitialCountdown()
        
        UIApplication.sharedApplication().statusBarHidden = true
    }
    
    func startInitialCountdown() {
        self.initialTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showTimer:", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.initialTimer!, forMode: NSDefaultRunLoopMode)
    }
    
    func startRoundCountdown() {
        self.roundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showRoundTimer:", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.roundTimer!, forMode: NSDefaultRunLoopMode)
    }
    
    func showTimer(timer: NSTimer) {
        self.charadeLabel?.text = "\(self.counter)"
        
        if (counter == 0) {
            self.initialTimer?.invalidate()
            self.count = 1
            self.charadeLabel?.text = "Charade \(self.count)"
            
            self.nextButton?.hidden = false
            self.jumpButton?.hidden = false
            self.roundTimerLabel?.hidden = false

            self.counter = 30
            
            self.startRoundCountdown()
        }
        
        self.counter -= 1
    }
    
    func showRoundTimer(timer: NSTimer) {
        self.roundTimerLabel?.text = "\(self.counter)"
        
        if (self.counter == 0) {
            self.roundTimer?.invalidate()
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        self.counter -= 1
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
//        UIDevice.currentDevice().setValue(value, forKey: "orientation")
//    }
    
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        return UIInterfaceOrientationMask.Landscape
//    }
    
}