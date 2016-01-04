//
//  GameRoundModel.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import Foundation

class GameRoundViewModel {
    
    var hits = [String]()
    
    func getCharadesList() -> [String] {
        return ["Charade 1", "Charade 2", "Charade 3", "Charade 4"]
    }
    
    func addHit(charade: String) {
        self.hits.append(charade)
    }
    
    func hitsCount() -> Int {
        return self.hits.count
    }
    
}