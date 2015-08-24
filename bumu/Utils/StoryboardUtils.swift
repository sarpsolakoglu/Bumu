//
//  StoryboardUtils.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 24/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func onboarding() -> UIStoryboard {
        return UIStoryboard(name:OnboardingStoryboard_Identifier, bundle:nil)
    }
    class func main() -> UIStoryboard {
        return UIStoryboard(name:MainStoryboard_Identifier, bundle:nil)
    }
}

extension UIStoryboardSegue {
    
}