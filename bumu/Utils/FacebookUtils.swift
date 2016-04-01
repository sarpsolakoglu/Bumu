//
//  FacebookUtils.swift
//  bumu
//
//  Created by Sarp Oğulcan Solakoğlu on 26/08/15.
//  Copyright (c) 2015 Sarp Oğulcan Solakoğlu. All rights reserved.
//

import Foundation
import FBSDKCoreKit

class FacebookUtils {
    
    class func getFacebookInfo(completion:(error:NSError?)->Void) {
        let infoRequest = FBSDKGraphRequest(graphPath: "me", parameters:["fields":"email,name,cover,id"], HTTPMethod: "GET")
        
        infoRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            /*
            if error == nil {
                if let userData = result as? NSDictionary, user = User.currentUser() {
                    user.email = userData["email"] as? String
                    user.fullName = userData["name"] as? String
                    user.facebookId = userData["id"] as? String
                    user.profilePhotoUrl = "https://graph.facebook.com/\(user.facebookId!)/picture"
                    completion(error: nil)
                } else {
                    completion(error:err_bumu_unknown)
                }
            } else {
                if let errorType = error!.userInfo["error"]?["type"] as? String {
                    if errorType == "OAuthException" {
                        print("The facebook session was invalidated")
                        Utils.appDelegate().logout()
                    } else {
                        print("error")
                        completion(error: error)
                    }
                } else {
                    print("error")
                    completion(error: error)
                }
            }*/
        }
    }
    
    class func syncFacebookFriends(completion:(friendIds:Array<String>?)->Void) {
        let friendRequest = FBSDKGraphRequest(graphPath: "me/friends", parameters:["fields":"id"], HTTPMethod: "GET")
        friendRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            /*
            if error == nil {
                if let userData = result as? NSDictionary,
                    user = User.currentUser(),
                    friends = userData["data"] as? NSArray {
                    var friendIds = Array<String>()
                    for friend in friends {
                        friendIds.append(friend["id"] as! String)
                    }
                    user.facebookFriendIds = friendIds
                    user.saveInBackground()
                    completion(friendIds: friendIds)
                }
            } else {
                completion(friendIds: nil)
            }*/
        }
    }
    /*
    class func findFacebookFriends(completion:(result:Array<User>)->Void) {
        
        if let user = User.currentUser(),
            friendIds = user.facebookFriendIds,
            query = User.query() {
                query.whereKey("facebookId", containedIn: friendIds)
                query.orderByAscending("fullName")
                query.findObjectsInBackgroundWithBlock({ (result, error) -> Void in
                    if let friends = result as? Array<User> {
                        completion(result: friends)
                    }
                })
        }
    }*/

}
