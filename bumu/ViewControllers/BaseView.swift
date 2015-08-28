//
//  BaseView.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 27/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit
import SnapKit

class ButtonWithActivity : UIButton {
    
    var activityIndicator : UIActivityIndicatorView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = .White
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        activityIndicator.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.trailing.equalTo(self.snp_right).offset(-14)
        }
    }
    
    func startAnimation() {
        enabled = false
        activityIndicator.startAnimating()
    }
    
    func stopAnimation() {
        enabled = true
        activityIndicator.stopAnimating()
    }
}

class BaseView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
