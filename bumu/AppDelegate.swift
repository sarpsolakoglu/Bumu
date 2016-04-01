//
//  AppDelegate.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 29/05/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        /*
        //onboarding, signup or login user
        if let user = User.currentUser() {
            if PFFacebookUtils.isLinkedWithUser(user) {
                if user.isActive != nil && user.isActive == true {
                    login()
                    print("logged in user")
                } else {
                    signup()
                    print("user needs to complete signup")
                }
            } else {
                onboarding()
            }
        } else {
           onboarding()
        }*/
        
        setAppearance()
        
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
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
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK:Remote notifications
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
      
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
       
    }
    
    //MARK:Login Logout UI Operations
    
    //perform login casses on the outside and last call this
    func login() {
        window?.rootViewController = UIStoryboard.main().instantiateInitialViewController() as? UITabBarController
    }
    
    func logout() {
        //User.logOutInBackground()
        window?.rootViewController = UIViewController.onboarding()
    }

    func signup() {
        window?.rootViewController = UIViewController.signup()
    }
    
    func onboarding() {
        window?.rootViewController = UIViewController.onboarding()
    }
    
    func onboarding(from:UIViewController) {
        let onboardingController = UIViewController.onboarding()
        UIView.transitionFromView(from.view, toView:onboardingController.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve) { (complete) -> Void in
            self.window?.rootViewController = onboardingController
        }
    }
    
    func login(from:UIViewController) {
        let loginController = UIStoryboard.main().instantiateInitialViewController() as! UITabBarController
        UIView.transitionFromView(from.view, toView:loginController.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve) { (complete) -> Void in
            self.window?.rootViewController = loginController
        }
    }
    
    func signup(from:UIViewController) {
        let signupController = UIViewController.signup()
        UIView.transitionFromView(from.view, toView:signupController.view, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve) { (complete) -> Void in
            self.window?.rootViewController = signupController
        }
    }
    
    func setAppearance() {
        UITabBar.appearance().translucent = false
        UITabBar.appearance().backgroundColor = UIColor.whiteColor()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
    }

}

