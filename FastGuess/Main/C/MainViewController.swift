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
        view.backgroundColor = bBackGroundColor()
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initSubViews() {
        imgView.hidden = true
        cycleScrollView.contentSize = CGSizeMake(kScreenWidth * 5, 150)
        let pictures = ["cycle_one.png", "cycle_two.png", "cycle_three.png"]
        for i in 0 ..< pictures.count + 2 {
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
            imgView.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(cycleScrollView.snp_top)
                make.left.equalTo(cycleScrollView.snp_left).offset((CGFloat)(i) * kScreenWidth)
                make.width.equalTo(cycleScrollView.snp_width)
                make.height.equalTo(cycleScrollView.snp_height)
            })
        }
        
        pageCtrl.currentPage = 0
        pageCtrl.backgroundColor = UIColor.clearColor()
        pageCtrl.numberOfPages = 3
        
        
        homeTableView = HomeTableView(frame: CGRectMake(0, 150, view.frame.size.width, view.frame.size.height - 150), style: .Grouped)
        view.addSubview(homeTableView)
        homeTableView.dataList = ["菠萝", "香蕉", "橘子", "苹果", "柚子", "西红柿", "梨子"]
        homeTableView.snp_makeConstraints { (make) in
            make.top.equalTo(150)
            make.left.equalTo(0)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height - 150)
        }
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
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    func reloadDataRefreshUI() {
        imgView!.image = UIImage(data: result!)
    }
    
    private func showProgressHUD() {
    
        let progressHUD = MBProgressHUD.showHUDAddedTo(view, animated: true)
        progressHUD.labelText = "正在加载..."
        
    }
    
    private func hideProgressHUD() {
        MBProgressHUD.hideAllHUDsForView(view, animated: true)
       
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

