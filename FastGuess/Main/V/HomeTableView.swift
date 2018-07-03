//
//  HomeTableView.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/11/18.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var dataList = [String]()
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
        register(HomeCell.self, forCellReuseIdentifier: identify)
//        registerClass(HomeCell.self, forCellReuseIdentifier: identify)
        separatorStyle = .none;
        //注册单元格xib
//        registerNib(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier:identify)
    }
    
    //MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identify)as! HomeCell
        cell.selectionStyle = .none;
        cell.titleStr = dataList[indexPath.row] as? String
        return cell
    }
    
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("the indexpath row is \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
