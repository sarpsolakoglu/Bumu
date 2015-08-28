//
//  AppDelegate.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 29/05/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import Parse
import Bolts
import FBSDKCoreKit
import ParseFacebookUtilsV4

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        //Parse
        self.registerParseSubclasses()
        
        Parse.setApplicationId(Parse_Application_Id,
            clientKey: Parse_Client_Key)
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        //Facebook + Parse
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        // Register for Push Notitications
        if application.applicationState != UIApplicationState.Background {
            // Track an app open here if we launch with a push, unless
            // "content_available" was used to trigger a background push (introduced in iOS 7).
            // In that case, we skip tracking here to avoid double counting the app-open.
            
            let preBackgroundPush = !application.respondsToSelector("backgroundRefreshStatus")
            let oldPushHandlerOnly = !self.respondsToSelector("application:didReceiveRemoteNotification:fetchCompletionHandler:")
            var pushPayload = false
            if let options = launchOptions {
                pushPayload = options[UIApplicationLaunchOptionsRemoteNotificationKey] != nil
            }
            if (preBackgroundPush || oldPushHandlerOnly || pushPayload) {
                PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
            }
        }
        if application.respondsToSelector("registerUserNotificationSettings:") {
            let userNotificationTypes = UIUserNotificationType.Alert | UIUserNotificationType.Badge | UIUserNotificationType.Sound
            let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //onboarding, signup or login user
        if let user = User.currentUser() {
            if PFFacebookUtils.isLinkedWithUser(user) {
                if user.isActive != nil && user.isActive == true {
                    login()
                    println("logged in user")
                } else {
                    signup()
                    println("user needs to complete signup")
                }
            } else {
                onboarding()
            }
        } else {
           onboarding()
        }
        
        setAppearance()
        
        window?.makeKeyAndVisible()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
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
        FBSDKAppEvents.activateApp();
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //MARK:Remote notifications
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        if error.code == 3010 {
            println("Push notifications are not supported in the iOS Simulator.")
        } else {
            println("application:didFailToRegisterForRemoteNotificationsWithError: %@", error)
        }
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        PFPush.handlePush(userInfo)
        if application.applicationState == UIApplicationState.Inactive {
            PFAnalytics.trackAppOpenedWithRemoteNotificationPayload(userInfo)
        }
    }
    
    //MARK:Parse operations
    
    func registerParseSubclasses() {
        User.registerSubclass()
    }
    
    //MARK:Login Logout UI Operations
    
    //perform login casses on the outside and last call this
    func login() {
        window?.rootViewController = UIStoryboard.main().instantiateInitialViewController() as? UITabBarController
    }
    
    func logout() {
        User.logOutInBackground()
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
        UITabBar.appearance().shadowImage = nil
    }

}

