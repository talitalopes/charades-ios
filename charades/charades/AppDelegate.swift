//
//  AppDelegate.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        UINavigationBar.customize()
        
        return true
    }

}

