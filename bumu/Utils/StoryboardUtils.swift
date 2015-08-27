//
//  StoryboardUtils.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 24/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import CRToast

extension UIViewController {
    
    class func onboarding()-> UIViewController {
        let storyboard = UIStoryboard.onboarding()
        
        let onboardingContainer = storyboard.instantiateViewControllerWithIdentifier(OnboardingContainerController_Identifier) as! BWWalkthroughViewController
        
        let onboardingOne: BWWalkthroughPageViewController = storyboard.instantiateViewControllerWithIdentifier(OnboardingPageOneController_Identifier) as! BWWalkthroughPageViewController
        
        let onboardingTwo: BWWalkthroughPageViewController = storyboard.instantiateViewControllerWithIdentifier(OnboardingPageTwoController_Identifier) as! BWWalkthroughPageViewController
        
        let onboardingThree: BWWalkthroughPageViewController = storyboard.instantiateViewControllerWithIdentifier(OnboardingPageThreeController_Identifier) as! BWWalkthroughPageViewController
        
        onboardingContainer.addViewController(onboardingOne)
        onboardingContainer.addViewController(onboardingTwo)
        onboardingContainer.addViewController(onboardingThree)
        
        return onboardingContainer
    }
    
    class func signup() -> UIViewController {
        let storyboard = UIStoryboard.signup()
        return storyboard.instantiateViewControllerWithIdentifier(SignupViewController.className) as! UIViewController
    }
    
    func showError(text:String) {
        self.showAlert(text, textColor: UIColor.whiteColor(), bgColor: UIColor.appRedColor())
    }
    
    func showAlert(text:String,textColor:UIColor,bgColor:UIColor) {
        var options = [kCRToastNotificationTypeKey as String:CRToastType.StatusBar.rawValue,
            kCRToastNotificationPresentationTypeKey as String:CRToastPresentationType.Cover.rawValue,
            kCRToastTextAlignmentKey as String:NSTextAlignment.Center.rawValue,
            kCRToastTimeIntervalKey as String:3.0,
            kCRToastAnimationInTypeKey as String:CRToastAnimationType.Linear.rawValue,
            kCRToastAnimationOutTypeKey as String:CRToastAnimationType.Linear.rawValue,
            kCRToastAnimationInDirectionKey as String:0,
            kCRToastAnimationOutDirectionKey as String:0,
            kCRToastFontKey as String:UIFont.bookAppFont(14)]
        options[kCRToastTextKey as String] = text
        options[kCRToastTextColorKey as String] = textColor
        options[kCRToastBackgroundColorKey as String] = bgColor
        CRToastManager.showNotificationWithOptions(options, completionBlock: { () -> Void in
            
        });
    }
}

extension UIStoryboard {
    class func onboarding() -> UIStoryboard {
        return UIStoryboard(name:OnboardingStoryboard_Identifier, bundle:nil)
    }
    class func main() -> UIStoryboard {
        return UIStoryboard(name:MainStoryboard_Identifier, bundle:nil)
    }
    class func signup() -> UIStoryboard {
        return UIStoryboard(name:SignupStoryboard_Identifier, bundle:nil)
    }
}

extension UIStoryboardSegue {
    
}