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

    @IBOutlet weak var gameStatusLabel : UILabel? {
        didSet {
            self.gameStatusLabel?.textColor =
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
    
    var presenter : GameRoundPresenter!
    
    func updateGameStatus(hits: Int, total: Int) {
        self.gameStatusLabel?.text = "Hits: \(hits) / Count: \(total)"
    }
    
    @IBAction func skipToNext() {
        self.presenter.skipToNext()
    }
    
    @IBAction func correctGuess() {
        self.presenter.correctGuess()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.view.backgroundColor = UIColor.roundBackgroundColor()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.presenter = GameRoundPresenter()
        self.presenter.setPresenterView(self)
        self.presenter.startRound()
    }
    
    func showTimer(time: Int) {
        self.charadeLabel?.text = "\(time)"
    }
    
    func initGame(charade: String) {
        self.nextButton?.hidden = false
        self.jumpButton?.hidden = false
        self.roundTimerLabel?.hidden = false
        self.gameStatusLabel?.hidden = false
        
        self.updateGameStatus(0, total: 1)
        
        self.showCharade(charade)
    }
    
    func showCharade(charade: String) {
        self.charadeLabel?.text = "\(charade)"
    }
    
    func showRoundTimer(time: Int) {
        self.roundTimerLabel?.text = "\(time)"
    }
    
    func dismiss() {
        self.navigationController?.popToRootViewControllerAnimated(true)
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