//
//  FontUtils.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 24/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import UIKit

let boldFont = "Dosis-Bold"
let extraBoldFont = "Dosis-ExtraBold"
let lightFont = "Dosis-Light"
let mediumFont = "Dosis-Medium"
let bookFont = "Dosis-Book"

extension UIFont {
    class func bookAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: bookFont, size: size)!
    }
    class func mediumAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: mediumFont, size: size)!
    }
    class func lightAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: lightFont, size: size)!
    }
    class func boldAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: boldFont, size: size)!
    }
    class func extraBoldAppFont(size: CGFloat) -> UIFont {
        return UIFont(name: extraBoldFont, size: size)!
    }
}