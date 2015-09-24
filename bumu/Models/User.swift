//
//  User.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 25/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import Parse
import Foundation

public enum ProfilePhotoSize : String {
    case Small = "small", Medium = "medium", Large = "large"
}

class User: PFUser {

    var isActive : Bool? {
        get { return self["isActive"] as? Bool }
        set { self["isActive"] = newValue }
    }
    
    var bumuName : String? {
        get { return self["bumuName"] as? String }
        set { self["bumuName"] = newValue }
    }
    
    var fullName : String? {
        get { return self["fullName"] as? String }
        set { self["fullName"] = newValue }
    }
    
    var firstName : String? {
        get { return fullName?.componentsSeparatedByString(" ").first }
    }
    
    var facebookId : String? {
        get { return self["facebookId"] as? String }
        set { self["facebookId"] = newValue }
    }
    
    var profilePhotoUrl : String? {
        get { return self["profilePhotoUrl"] as? String }
        set { self["profilePhotoUrl"] = newValue }
    }
    
    var facebookFriendIds : Array<String>? {
        get { return self["facebookFriendsIds"] as? Array<String> }
        set { self["facebookFriendsIds"] = newValue }
    }
    
    func profilePhotoUrl(type:ProfilePhotoSize) -> String? {
        if let profilePhotoUrl = profilePhotoUrl {
            return "\(profilePhotoUrl)?type=\(type.rawValue)"
        }
        return nil
    }
}
