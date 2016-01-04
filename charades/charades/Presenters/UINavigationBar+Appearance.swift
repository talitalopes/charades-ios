//
//  UINavigationBar+Appearance.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    static func customize() {
        UINavigationBar.appearance().barTintColor = UIColor.navigationBarColor()
        UINavigationBar.appearance().tintColor = UIColor.navigationBarTintColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    
}