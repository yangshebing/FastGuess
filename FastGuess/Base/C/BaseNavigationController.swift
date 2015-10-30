//
//  BaseNavigationController.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/27.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = bMainColor()
        self.navigationBar.translucent = false
//        UIApplication.sharedApplication().statusBarStyle = .LightContent;
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent;
    }
}
