//
//  MessagingTopViewController.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 02/09/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import pop

class MessagingTopViewController: UIViewController {
    
    @IBOutlet weak var switchButton: UIButton!
    
    var containerViewController : MessagingContainerViewController?
    var rotation : Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        rotation = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchViewController(sender: AnyObject) {
        containerViewController?.swapViewControllers()
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerRotation)
        rotation = rotation == 0 ? M_PI : 0
        animation.toValue = rotation
        switchButton.layer.pop_addAnimation(animation, forKey: "rotate")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == ID_S_MessagingContainerEmbedSegue {
            containerViewController = segue.destinationViewController as?MessagingContainerViewController
        }
    }
    

}
