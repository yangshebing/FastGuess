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
        let leftButton = UIButton.init(type: .custom)
        leftButton.frame = CGRectMake(0, 0, 64, 45);
        leftButton.setTitle("返回", for: .normal)
        leftButton.setTitleColor(UIColorFromHexColor(0xffffff), for: .normal)
        leftButton.titleLabel!.font = UIFont.systemFont(ofSize: 15)
        leftButton.addTarget(self, action: #selector(backAction(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftButton)
    }
    
    @objc func backAction (_ sender:UIButton) {
        if let title = sender.titleLabel?.text {
            print("dai can shu：\(title)")
        }
        self.navigationController!.popViewController(animated: true)
    }
}
