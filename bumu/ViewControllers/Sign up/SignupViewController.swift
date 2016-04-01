//
//  SignupViewController.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 25/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import SnapKit

enum SignupInputFieldState {
    case Default, Error, Success
}

class SignupTextField : UITextField {
    
    var statusLayer : CALayer!
    
    var didSetup = false

    func setupView() {
        if !didSetup {
            didSetup = true
            addStatusLayer()
        }
    }
    
    func addStatusLayer() {
        statusLayer = CALayer()
        statusLayer.frame = CGRectMake(0, bounds.height - 2, bounds.width, 2)
        self.layer.addSublayer(statusLayer)
        setState(.Default)
    }
    
    func setState(state:SignupInputFieldState) {
        switch state {
        case .Default:
            statusLayer.backgroundColor = UIColor.appDarkColor().CGColor
        case .Error:
            statusLayer.backgroundColor = UIColor.appRedColor().CGColor
        case .Success:
            statusLayer.backgroundColor = UIColor.appBlueColor().CGColor
        }
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 0)
    }
}

class SignupViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var topLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var keyboardBottomLayoutConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var usernameField: SignupTextField!
    
    @IBOutlet weak var emailField: SignupTextField!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var signupButton: ButtonWithActivity!
    
    @IBOutlet weak var activityIndicator : UIActivityIndicatorView!
    
    
    var activeTextField : UITextField?
    
    //MARK:View states
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        /*
        FacebookUtils.getFacebookInfo { error in
            if error == nil {
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.activityIndicator.stopAnimating()
                    
                    if let email = User.currentUser()?.email {
                        self.emailField.text = email
                        self.emailField.enabled = false
                        self.emailField.setState(.Success)
                        self.usernameField.returnKeyType = UIReturnKeyType.Done
                    } else {
                        self.usernameField.returnKeyType = UIReturnKeyType.Next
                        self.emailField.returnKeyType = UIReturnKeyType.Done
                    }
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.usernameField.layer.opacity = 1
                        self.emailField.layer.opacity = 1
                    })
                    
                    self.greetingLabel.text = Utils.localizedString("Merhaba") + " " + User.currentUser()!.firstName! + "!"
                    
                    self.signupButton.enabled = true
                })
            } else if error != nil {
                //TODO:Error
                Utils.appDelegate().logout()
            }
        }*/
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        usernameField.setupView()
        emailField.setupView()
    }
    
    override func viewWillAppear(animated: Bool) {
        registerForKeyboardNotifications()
    }
    
    override func viewWillDisappear(animated: Bool) {
        deregisterFromKeyboardNotifications()
    }
    
    func setupView() {
        //view.addGestureRecognizer(UIGestureRecognizer(target: self, action: Selector("closeKeyboard:")))
        
        usernameField.delegate = self
        emailField.delegate = self
        
        usernameField.keyboardType = UIKeyboardType.Default
        emailField.keyboardType = UIKeyboardType.EmailAddress
        
        activityIndicator.startAnimating()
        usernameField.layer.opacity = 0
        emailField.layer.opacity = 0
        signupButton.enabled = false
        
        greetingLabel.text = Utils.localizedString("Merhaba")
    }
    
    //MARK:Notifications
    override func keyboardWillShow(notification:NSNotification) -> () {
   
        if let info = notification.userInfo,
            keyboardSize = info[UIKeyboardFrameEndUserInfoKey]?.CGRectValue.size,
        duration = info[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue,
            curveInt = info[UIKeyboardAnimationCurveUserInfoKey]?.integerValue
        {
            let curve = UIViewAnimationCurve(rawValue: curveInt)!
            keyboardBottomLayoutConstraint.constant = keyboardSize.height
            topLayoutConstraint.constant = 0
            UIView.animateWithDuration(duration, animations: { () -> Void in
                UIView.setAnimationCurve(curve)
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func keyboardWillHide(notification:NSNotification) -> () {
        if let info = notification.userInfo,
            duration = info[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue,
            curveInt = info[UIKeyboardAnimationCurveUserInfoKey]?.integerValue
        {
            let curve = UIViewAnimationCurve(rawValue: curveInt)!
            keyboardBottomLayoutConstraint.constant = 0
            topLayoutConstraint.constant = 120
            UIView.animateWithDuration(duration, animations: { () -> Void in
                UIView.setAnimationCurve(curve)
                self.view.layoutIfNeeded()
            })
        }
    }

    //MARK:TextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        activeTextField = nil
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if let nextTag = activeTextField?.tag,
            nextResponder = activeTextField?.superview?.viewWithTag(nextTag+1) as UIResponder!{
            nextResponder.becomeFirstResponder()
        } else {
            activeTextField?.resignFirstResponder()
        }

        return false
    }
    
    //MARK:Action
    
    @IBAction func closeKeyboard(sender: AnyObject) {
        activeTextField?.resignFirstResponder()
    }
    
    @IBAction func signUpPressed(sender: AnyObject) {
        
        if emailField.text?.characters.count == 0 {
            showError(Utils.localizedString("E-posta alanı boş olamaz."))
            emailField.setState(.Error)
            return
        }
        
        if usernameField.text?.characters.count == 0 {
            showError(Utils.localizedString("Kullanıcı adı boş olamaz."))
            usernameField.setState(.Error)
            return
        }
        /*
        let user = User.currentUser()!
        user.email = emailField.text!.trim()
        user.bumuName = usernameField.text!.trim()
        
        usernameField.setState(.Default)
        emailField.setState(.Default)
        
        let query = User.query()
        
        query?.whereKey("bumuName", containsString: user.bumuName)
        signupButton.startAnimation()
        query?.findObjectsInBackgroundWithBlock({ (result, error) -> Void in
            if let users = result as? Array<User> {
                if users.count > 0 {
                    self.showError(Utils.localizedString("Bu kullanıcı adı kullanılıyor."))
                    self.usernameField.setState(.Error)
                    self.signupButton.stopAnimation()
                } else {
                    user.isActive = true
                    user.saveInBackgroundWithBlock({ (success, error) -> Void in
                        if  error == nil {
                            self.usernameField.setState(.Success)
                            self.emailField.setState(.Success)
                            FacebookUtils.syncFacebookFriends({ (friendIds) -> Void in
                                Utils.appDelegate().login(self)
                            })
                        } else {
                            self.showError(Utils.localizedString("Giriş başarısız."))
                        }
                        self.signupButton.stopAnimation()
                    })
                }
            }
        })*/
    }

}
