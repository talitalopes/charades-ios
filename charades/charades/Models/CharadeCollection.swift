//
//  CharadeCollection.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import Foundation

class CharadeCollection {
    
    var title : String
    var values : [Charade]
    
    init(title: String, values: [Charade]) {
        self.title = title
        self.values = values
    }
    
}