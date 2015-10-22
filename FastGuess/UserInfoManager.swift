//
//  UserInfoManager.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/20.
//  Copyright © 2015年 FAL. All rights reserved.
//

import Foundation
//写法一：
public class UserInfoManager {
    var userName:String?
    var avatar:String?
    var userId = 0
    var age:String?
    var sex:String?
    public static let sharedInstance: UserInfoManager = {
        return UserInfoManager()
        }()
}

//写法二：
//let _sharedInstance =  UserInfoManager()
//class UserInfoManager {
//    var userName:String?
//    var avatar:String?
//    var userId = 0
//    var age:String?
//    var sex:String?
//    class var sharedInstance : UserInfoManager{
//        return _sharedInstance
//    }
//}

//写法三：
//class UserInfoManager {
//    var userName:String?
//    var avatar:String?
//    var userId = 0
//    var age:String?
//    var sex:String?
//    class var sharedInstance:  UserInfoManager {
//        struct Static {
//            static let instance: UserInfoManager = UserInfoManager();
//        }
//        return Static.instance
//    }
//}

//写法四：
//class UserInfoManager {
//    var userName:String?
//    var avatar:String?
//    var userId = 0
//    var age:String?
//    var sex:String?
//
//    class var sharedInstance :  UserInfoManager {
//        struct Static {
//            static var onceToken:dispatch_once_t = 0;
//            static var instance: UserInfoManager? = nil;
//        }
//        
//        dispatch_once(&Static.onceToken) {
//            Static.instance = UserInfoManager()
//        }
//        
//        //这个地方有什么区别呢？
////        dispatch_once(&Static.onceToken) { () -> Void in
////             Static.instance = UserInfoManager()
////        }
//        return Static.instance!
//    }
//}
