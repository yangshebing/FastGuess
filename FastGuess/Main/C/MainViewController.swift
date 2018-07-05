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
    var result:Data?
    let pageCount = 0
    var homeTableView:HomeTableView!
    var leftBtn:UIButton?
    
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
        Alamofire.request(URL.init(string: "http://b.hiphotos.baidu.com/image/pic/item/f9198618367adab49ba3154489d4b31c8701e442.jpg")!, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                self.result = response.data
                DispatchQueue.main.async {
                    self.reloadDataRefreshUI()
                }
        }
        
        //初始化子视图
        self.initSubViews()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func initSubViews() {
        imgView.isHidden = true
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
            imgView.snp.makeConstraints {(make) in
                make.top.equalTo(cycleScrollView.snp.top)
                make.left.equalTo(cycleScrollView.snp.left).offset((CGFloat)(i) * kScreenWidth)
                make.width.equalTo(cycleScrollView.snp.width)
                make.height.equalTo(cycleScrollView.snp.height)
            }
        }
        
        pageCtrl.currentPage = 0
        pageCtrl.backgroundColor = UIColor.clear
        pageCtrl.numberOfPages = 3
        pageCtrl.currentPageIndicatorTintColor = UIColor.red
        
        homeTableView = HomeTableView(frame: CGRectMake(0, 150, view.frame.size.width, view.frame.size.height - 150), style: .grouped)
        view.addSubview(homeTableView)
        homeTableView.dataList = ["菠萝", "香蕉", "橘子", "苹果", "柚子", "西红柿", "梨子"]
        homeTableView.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.left.equalTo(0)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.height - 150)
        }
        
        leftBtn = UIButton(type: .custom)
        leftBtn?.frame = CGRectMake(0, 0, 60, 44)
        leftBtn?.setTitle("保存", for: .normal)
        leftBtn?.setTitleColor(UIColor.gray, for: .normal)
        leftBtn?.addTarget(self, action:#selector(didTapSave(_:)) , for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: leftBtn!)
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
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
    
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)
        progressHUD.label.text = "正在加载..."
        
    }
    
    private func hideProgressHUD() {
        MBProgressHUD.hide(for: view, animated: true)
       
    }
    
    private func loadPicture() {
        let urlString = "http://ww3.sinaimg.cn/bmiddle/e4bfd450jw1ex53f5h9aej20c80m3jsd.jpg"
        showProgressHUD()
        Alamofire.request(URL.init(string: urlString)!, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
                debugPrint(response)
                self.result = response.data
                DispatchQueue.main.async {
                    self.hideProgressHUD()
                }
        }
    }
    
   @objc func didTapSave(_ sender:UIButton) {
        print("test save")
        if let btnTitle = sender.titleLabel?.text {
            print("the button title is: \(btnTitle)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

