//
//  GameRoundPresenter.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import Foundation

class GameRoundPresenter : NSObject {
    
    var model : GameRoundViewModel!
    weak var view : GameRoundViewController?
    
    var count : Int = 0
    
    var initialTimer : NSTimer?
    var roundTimer : NSTimer?
    var counter = 3
    var currentCharade : String!
    var charades = [String]()
    
    override init() {
        super.init()
        self.model = GameRoundViewModel()
    }
    
    func setPresenterView(view: GameRoundViewController) {
        self.view = view
    }

    func startRound() {
        self.startInitialCountdown()
        self.charades = self.model.getCharadesList()
    }
    
    func startInitialCountdown() {
        self.initialTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showTimer", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.initialTimer!, forMode: NSDefaultRunLoopMode)
    }
    
    func startRoundCountdown() {
        self.roundTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "showRoundTimer", userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(self.roundTimer!, forMode: NSDefaultRunLoopMode)
    }
    
    func showTimer() {
        self.view?.showTimer(self.counter)
        
        if (counter == 0) {
            self.initialTimer?.invalidate()
            self.count = 1
            self.currentCharade = self.charades[0]
            self.view?.initGame(self.currentCharade)
            self.counter = 30
            
            self.startRoundCountdown()
        }
        
        self.counter -= 1
    }
    
    func showRoundTimer() {
        self.view?.showRoundTimer(self.counter)
        
        if (self.counter == 0) {
            self.roundTimer?.invalidate()
            self.view?.dismiss()
        }
        
        self.counter -= 1
    }
    
    func skipToNext() {
        self.count += 1
        self.view?.updateGameStatus(self.model.hitsCount(), total: self.count)
        
        if (self.count <= self.charades.count) {
            self.currentCharade = self.charades[self.count-1]
            self.view?.showCharade(self.currentCharade)
        } else {
            self.view?.dismiss()
        }
    }
    
    func correctGuess() {
        self.model.addHit(self.currentCharade)
        self.skipToNext()
    }
        
}