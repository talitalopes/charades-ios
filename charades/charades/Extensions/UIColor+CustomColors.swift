//
//  ColorsEnum.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func navigationBarColor() -> UIColor {
        return UIColor(red: 57.0/255.0, green: 50.0/255.0, blue: 118.0/255.0, alpha: 1.0)
    }
    
    static func navigationBarTintColor() -> UIColor {
        return UIColor.whiteColor()
    }
 
    static func mainBackgoundColor() -> UIColor {
        return UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
    }
    
    static func charadesCollectionColor() -> UIColor {
        return UIColor.whiteColor()
    }
    
    static func charadesCollectionTextColor() -> UIColor {
        return UIColor.darkTextColor()
    }
    
    static func buttonBackgroundColor() -> UIColor {
        return UIColor(red: 170.0/255.0, green: 126.0/255.0, blue: 57.0/255.0, alpha: 1.0)
    }
    
    static func shadowColor() -> UIColor {
        return UIColor.blackColor()
    }
    
    static func roundBackgroundColor() -> UIColor {
        return UIColor(red: 57.0/255.0, green: 50.0/255.0, blue: 118.0/255.0, alpha: 1.0)
    }
    
    static func roundCharadeTextColor() -> UIColor {
        return UIColor.whiteColor()
    }

    static func roundStatusTextColor() -> UIColor {
        return UIColor.lightTextColor()
    }

}