//
//  APIClient.swift
//  UITestDemo
//
//  Created by Wei Wang on 15/9/9.
//  Copyright © 2015年 OneV's Den. All rights reserved.
//

import Foundation

let userInfo = ["onevcat": "123"]

struct APIClient {
    
    enum APIError {
        case EmptyUserName, EmptyPassword, UserNotFound, WrongPassword
    }
    
    static func login(userName: String, password: String, completionHandler: ((Bool, APIError?) -> ())?) {
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))),
                       dispatch_get_main_queue()) { () -> Void in
            if userName.characters.count == 0 {
                completionHandler?(false, .EmptyUserName)
                return
            }
            
            if password.characters.count == 0 {
                completionHandler?(false, .EmptyPassword)
                return
            }
            
            if !userInfo.keys.contains(userName) {
                completionHandler?(false, .UserNotFound)
                return
            }
            
            if userInfo[userName] != password {
                completionHandler?(false, .WrongPassword)
                return
            }
                        
            completionHandler?(true, nil)
        }
    }
}