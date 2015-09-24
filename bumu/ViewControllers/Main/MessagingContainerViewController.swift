//
//  MessagingContainerViewController.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 02/09/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import SnapKit

class MessagingContainerViewController: UIViewController {
    
    var currentSegueIdentifier : String?
    var transitionInProgress = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let selection = defaults.objectForKey("selection") as? String {
           currentSegueIdentifier = selection
        } else {
            currentSegueIdentifier = ID_S_MessagingContainerInboxSegue
        }
        
        performSegueWithIdentifier(currentSegueIdentifier!, sender: self)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let destVc = segue.destinationViewController 
        let destView = destVc.view
        
        if childViewControllers.count == 0 {
            addChildViewController(destVc)
            destView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(destView)
            destView.snp_makeConstraints(closure: { (make) -> Void in
                make.edges.equalTo(self.view)
            })
            destVc.didMoveToParentViewController(self)
        } else {
            self.swapFromViewController(childViewControllers[0] , toVC:destVc)
        }
    }
    
    private func swapFromViewController(fromVC:UIViewController, toVC:UIViewController) {
        toVC.view.frame = view.bounds
        
        fromVC.willMoveToParentViewController(nil)
        addChildViewController(toVC)
        
        
        transitionFromViewController(fromVC, toViewController: toVC, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: nil, completion: { _ -> Void in
            fromVC.removeFromParentViewController()
            toVC.didMoveToParentViewController(self)
            self.transitionInProgress = false
        })
    }
    
    func swapViewControllers () {
        if transitionInProgress {return}
        
        self.currentSegueIdentifier = self.currentSegueIdentifier == ID_S_MessagingContainerInboxSegue ? ID_S_MessagingContainerOutboxSegue : ID_S_MessagingContainerInboxSegue
        
        self.transitionInProgress = true
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(currentSegueIdentifier, forKey: "selection")
        defaults.synchronize()
        performSegueWithIdentifier(currentSegueIdentifier!, sender: self)
    }

}
