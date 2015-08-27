//
//  ElasticTextField.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 27/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit

class ElasticTextField: UITextField {

    var elasticView : ElasticView!
    var didSetup = false
    
    @IBInspectable var overshootAmount: CGFloat = 10 {
        didSet {
            elasticView.overshootAmount = overshootAmount
        }
    }
    
    //WARNING: Call this in viewControllers viewDidLayoutSubviews
    func setupView() {
        if !didSetup {
            didSetup = true
            
            clipsToBounds = false
            borderStyle = .None
            
            elasticView = ElasticView(frame: bounds)
            elasticView.backgroundColor = backgroundColor
            addSubview(elasticView)
            
            backgroundColor = UIColor.clearColor()
            
            elasticView.userInteractionEnabled = false
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        elasticView.touchesBegan(touches, withEvent: event)
    }

}
