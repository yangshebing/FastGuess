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
        self.navigationBar.isTranslucent = false
//        UIApplication.sharedApplication().statusBarStyle = .LightContent;
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
