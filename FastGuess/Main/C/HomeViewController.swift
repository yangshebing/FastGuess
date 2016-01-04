//
//  HomeViewController.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/20.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("the username is \(UserInfoManager.sharedInstance.userName)")
        view.backgroundColor = UIColor.blueColor()
    }
}