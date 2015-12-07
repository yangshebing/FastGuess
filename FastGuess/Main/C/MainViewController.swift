//
//  ViewController.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/18.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD
//import UserInfoManager
class MainViewController: BaseViewController, UIScrollViewDelegate {
//    var imgView:UIImageView?
    var result:NSData?
    let pageCount = 0
    var homeTableView:HomeTableView!
    
    @IBOutlet weak var cycleScrollView: UIScrollView!
    
    @IBOutlet weak var pageCtrl: UIPageControl!
    
    @IBAction func pageControlChangeAction(sender: UIPageControl) {
        cycleScrollView.setContentOffset(CGPointMake((CGFloat)(pageCtrl.currentPage) * kScreenWidth, cycleScrollView.contentOffset.y), animated: true)
    }
    
//    var pushButton:UIButton?
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = bBackGroundColor()
//        self.loadPicture()
        Alamofire.request(.GET, "http://b.hiphotos.baidu.com/image/pic/item/f9198618367adab49ba3154489d4b31c8701e442.jpg")
        .responseJSON { (response) -> Void in
//            print(response.data)
            self.result = response.data
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.reloadDataRefreshUI()
            })
        }
        //初始化子视图
        self.initSubViews()
//        UserInfoManager.sharedInstance.userName = "杨社兵"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initSubViews() {
        self.imgView.hidden = true
//        imgView = UIImageView(frame: CGRectMake(0, 64 + 100, 200, 200))
//        self.view.addSubview(imgView!)
//        pushButton = UIButton(type: .Custom)
//    pushButton.backgroundColor = UIColor.blackColor()
//        pushButton!.frame = CGRectMake((self.view.frame.size.width - 100) / 2.0, 64, 100, 100)
//    pushButton.setTitle("pushAction", forState: .Normal)
//    pushButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        pushButton.layer.cornerRadius = 3
//        pushButton.layer.masksToBounds = true
//        pushButton!.addTarget(self, action:"pushAction", forControlEvents: .TouchUpInside)
//        self.view.addSubview(pushButton!)
        cycleScrollView.contentSize = CGSizeMake(kScreenWidth * 5, 150)
        let pictures = ["cycle_one.png", "cycle_two.png", "cycle_three.png"]
        for var i = 0; i < pictures.count + 2; i++ {
            let imgView = UIImageView();
            imgView.translatesAutoresizingMaskIntoConstraints = false
            if i == 0 {
                imgView.image = UIImage(named: pictures.last!)
            } else if i == (pictures.count + 1) {
                imgView.image = UIImage(named: pictures.first!)
            } else {
                imgView.image = UIImage(named: pictures[i - 1])
            }
            cycleScrollView.addSubview(imgView)
            var cn = NSLayoutConstraint(item: imgView, attribute: .Top, relatedBy: .Equal, toItem: cycleScrollView, attribute: .Top, multiplier: 1.0, constant: 0.0)
            cycleScrollView.addConstraint(cn)
            cn = NSLayoutConstraint(item: imgView, attribute: .Left, relatedBy: .Equal, toItem: cycleScrollView, attribute: .Left, multiplier: 1.0, constant: (CGFloat)(i) * kScreenWidth)
            cycleScrollView.addConstraint(cn)
            cn = NSLayoutConstraint(item: imgView, attribute: .Width, relatedBy: .Equal, toItem: cycleScrollView, attribute: .Width, multiplier: 1.0, constant: 0.0)
            cycleScrollView.addConstraint(cn)
            cn = NSLayoutConstraint(item: imgView, attribute: .Height, relatedBy: .Equal, toItem: cycleScrollView, attribute: .Height, multiplier: 1.0, constant: 0.0)
            cycleScrollView.addConstraint(cn)
        }
        
        pageCtrl.currentPage = 0
        pageCtrl.backgroundColor = UIColor.clearColor()
        pageCtrl.numberOfPages = 3
        
        
        homeTableView = HomeTableView(frame: CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height - 150), style: .Grouped)
        self.view.addSubview(homeTableView)
        homeTableView.dataList = ["菠萝", "香蕉", "橘子", "苹果", "柚子"]
        homeTableView.translatesAutoresizingMaskIntoConstraints = false
        var cn = NSLayoutConstraint(item: homeTableView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 150.0)
        self.view.addConstraint(cn)
        cn = NSLayoutConstraint(item: homeTableView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        self.view.addConstraint(cn)
        cn = NSLayoutConstraint(item: homeTableView, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: self.view.frame.width)
        self.view.addConstraint(cn)
        cn = NSLayoutConstraint(item: homeTableView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 1.0, constant: kScreenHeight - 150)
        self.view.addConstraint(cn)
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let page = (Int)(scrollView.contentOffset.x / kScreenWidth);
        if page > 3 {
            scrollView .setContentOffset(CGPointMake(kScreenWidth, scrollView.contentOffset.y), animated: false)
            pageCtrl.currentPage = 0
        } else if page < 1 {
            scrollView.setContentOffset(CGPointMake((CGFloat)(pageCtrl.numberOfPages) * kScreenWidth, scrollView.contentOffset.y), animated: false)
            pageCtrl.currentPage = 2
        } else {
            pageCtrl.currentPage = page - 1
        }
    }
    
    //MARK: - ClickEvent
    func pushAction() {
        let homeVC = HomeViewController()
//        self.presentViewController(homeVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func reloadDataRefreshUI() {
        imgView!.image = UIImage(data: self.result!)
    }
    
    private func showProgressHUD() {
    
        let progressHUD = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHUD.labelText = "正在加载..."
        
    }
    
    private func hideProgressHUD() {
        MBProgressHUD.hideAllHUDsForView(self.view, animated: true)
       
    }
    
    private func loadPicture() {
        let urlString = "http://ww3.sinaimg.cn/bmiddle/e4bfd450jw1ex53f5h9aej20c80m3jsd.jpg"
        showProgressHUD()
        Alamofire.request(.GET, urlString)
        .responseJSON { (response) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.hideProgressHUD()
            })
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

