//
//  HomeTableView.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/11/18.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var dataList = [AnyObject]()
    let identify = "homeCellId"
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame:frame, style:style)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubviews () {
        dataSource = self;
        delegate = self;
        //注册单元格class
        registerClass(HomeCell.self, forCellReuseIdentifier: identify)
        separatorStyle = .None;
        //注册单元格xib
//        registerNib(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier:identify)
    }
    
    //MARK: - UITableViewDataSource

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1; //default 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(identify)as! HomeCell
        cell.selectionStyle = .None;
        cell.titleStr = dataList[indexPath.row] as? String
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("the indexpath row is \(indexPath.row)")
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
