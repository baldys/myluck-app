//
//  AppDelegate.swift
//  myluck
//
//  Created by Chris on 2014-11-30.
//  Copyright (c) 2014 greenwood. All rights reserved.
//

import UIKit


struct colors {
    
    static var primaryLight = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
    static var primaryDark = UIColor(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
    
    static var successLight = UIColor(red: 140/255.0, green: 198/255.0, blue: 63/255.0, alpha: 1.0)
    static var successDark = UIColor(red: 128/255.0, green: 178/255.0, blue: 50/255.0, alpha: 1.0)

    static var failLight = UIColor(red: 193/255.0, green: 39/255.0, blue: 45/255.0, alpha: 1.0)
    static var failDark = UIColor(red: 178/255.0, green: 31/255.0, blue: 42/255.0, alpha: 1.0)
}


class game {
    var streak = 0
    
}






@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

