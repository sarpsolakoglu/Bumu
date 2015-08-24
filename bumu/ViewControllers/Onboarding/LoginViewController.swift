//
//  LoginViewController.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 09/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import ParseFacebookUtilsV4
import Parse
import Bolts


class LoginViewController: BaseViewController {
    
    @IBOutlet weak var promptLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PFUser.currentUser() != nil {
            self.promptLabel.text = "logged in"
        } else {
            self.promptLabel.text = "logged out"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(sender:AnyObject?) {
        
        var permissions = ["public_profile","user_friends","user_birthday","email"];
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions, block: {[unowned self] (user, error) -> Void in
            if let user = user  {
                if user.isNew {
                    println("user signed up")
                } else {
                    println("user logged in")
                }
                self.promptLabel.text = "logged in"
            } else {
                println("error")
            }
        });
    }
    
    @IBAction func logout(sender:AnyObject?) {
        PFUser.logOutInBackgroundWithBlock {[unowned self] (error) -> Void in
            if error != nil {
                println("error")
            }
            self.promptLabel.text = "logged out"
        }
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
