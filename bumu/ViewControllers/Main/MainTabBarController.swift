//
//  MainTabBarController.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 30/05/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit

class MainTabBarController : UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonImage = UIImage(named: "bm_tb_middle")!
        
        var button: UIButton = UIButton(frame: CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height))
        
        button.setBackgroundImage(buttonImage, forState: .Normal)
        button.setBackgroundImage(buttonImage, forState: .Highlighted)
        
        let heightDifference = buttonImage.size.height - tabBar.frame.size.height
        
        if heightDifference < 0 {
            button.center = tabBar.center
        } else {
            let bCenter = tabBar.center
            button.center = CGPointMake(tabBar.center.x, tabBar.center.y - heightDifference/2.0)
        }
        
        view.addSubview(button)
        
        tabBar.itemPositioning = .Automatic
        
        if let items = tabBar.items as? Array<UITabBarItem> {
            items[0].image = UIImage(named: "bm_tb_message")?.imageWithRenderingMode(.AlwaysOriginal)
            items[0].selectedImage = UIImage(named: "bm_tb_message_s")?.imageWithRenderingMode(.AlwaysOriginal)
            items[1].image = UIImage(named: "bm_tb_friend")?.imageWithRenderingMode(.AlwaysOriginal)
            items[1].selectedImage = UIImage(named: "bm_tb_friend_s")?.imageWithRenderingMode(.AlwaysOriginal)
        }
    }
}
