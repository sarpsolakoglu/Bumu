//
//  SignupViewController.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 25/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import ParseFacebookUtilsV4

class SignupViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        FacebookUtils.getFacebookInfo { error in
            if error == nil {
                
            } else if error != nil {
                    
            }
        }
        
        FacebookUtils.syncFacebookFriends()
        // Do any additional setup after loading the view.
    }
    
    
    
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
