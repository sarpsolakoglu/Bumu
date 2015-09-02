//
// Created by Sarp Oğulcan Solakoğlu on 17/06/15.
// Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import Foundation
//MARK:Keys
let Parse_Application_Id = "REFtmXF6CAGQtVeCaQkwj8zCwSBG00l9LtBJ1oV6"
let Parse_Client_Key = "6UMZz7zH1MNhcUCIfx96V96xFOEhKrjQPYiw2aH7"

//MARK:View Controller Identifiers
let ID_VC_MainTabBarController = "MainTabBarController"
let ID_VC_LoginViewController = "LoginViewController"
let ID_VC_OnboardingContainerController = "onboarding_container"
let ID_VC_OnboardingPageOneController = "onboarding_page_one"
let ID_VC_OnboardingPageTwoController = "onboarding_page_two"
let ID_VC_OnboardingPageThreeController = "onboarding_page_three"

//MARK:Storyboard Identifiers
let ID_SB_OnboardingStoryboard = "Onboarding"
let ID_SB_MainStoryboard = "Main"
let ID_SB_SignupStoryboard = "Signup"

//MARK:Segue Identifiers
let ID_S_MessagingContainerInboxSegue = "messagingContainerInboxSegue"
let ID_S_MessagingContainerOutboxSegue = "messagingContainerOutboxSegue"
let ID_S_MessagingContainerEmbedSegue = "messagingContainerEmbedSegue"

//MARK:Facebook
let fb_permissions = ["public_profile","user_friends","email"]

//MARK:Errors
let err_bumu_unknown = NSError(domain: "com.sarpsolakoglu.bumu", code: 1, userInfo: nil)