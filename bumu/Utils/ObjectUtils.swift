//
//  ObjectUtils.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 25/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import Foundation

extension NSObject {
    class var className : String {
        return NSStringFromClass(self).componentsSeparatedByString(".").last!
    }
    var className : String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
}