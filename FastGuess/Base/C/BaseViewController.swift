//
//  BaseViewController.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/28.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let count = self.navigationController!.viewControllers.count;
        if (count > 1) {
            self.initNavSubview()
            
        }
    }
    
    func initNavSubview() {
        let leftButton = UIButton.init(type: .Custom);
        leftButton.frame = CGRectMake(0, 0, 64, 45);
        leftButton.setTitle("返回", forState: .Normal)
        leftButton.setTitleColor(UIColorFromHexColor(0xffffff), forState: .Normal)
        leftButton.titleLabel!.font = UIFont.systemFontOfSize(15)
        leftButton.addTarget(self, action: #selector(BaseViewController.backAction), forControlEvents: .TouchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
    }
    
    func backAction () {
        self.navigationController!.popViewControllerAnimated(true)
    }
}
