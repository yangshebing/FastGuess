//
//  ViewController.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/18.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    var imgView:UIImageView?
    var result:NSData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request(.GET, "http://b.hiphotos.baidu.com/image/pic/item/f9198618367adab49ba3154489d4b31c8701e442.jpg")
        .responseJSON { (response) -> Void in
            print(response.data)
            self.result = response.data
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.reloadDataRefreshUI()
            })
        }
        //初始化子视图
        self.initSubViews()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initSubViews() {
        imgView = UIImageView.init(frame: CGRectMake(0, 100, 200, 200))
        self.view.addSubview(imgView!)
    }
    
    
    func reloadDataRefreshUI() {
        imgView!.image = UIImage.init(data: self.result!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

