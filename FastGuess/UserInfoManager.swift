//
//  UserInfoManager.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/20.
//  Copyright © 2015年 FAL. All rights reserved.
//

import Foundation
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