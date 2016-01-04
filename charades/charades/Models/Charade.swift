//
//  Charade.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import Foundation

class Charade {
 
    var expression : String
    var definition : String?
    
    init(expression: String, definition: String? = nil) {
        self.expression = expression
        self.definition = definition
    }
    
}