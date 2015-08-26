//
//  StoryboardUtils.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 24/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit

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