//
//  HomeCell.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/11/19.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit
class HomeCell: UITableViewCell {
    var imgView:UIImageView!
    var titleLabel:UILabel!
    var button:UIButton!
    var titleStr:String?
    // 重写初始化方法
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        initSubviews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:)has not been implemented")
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initSubviews () {
        imgView = UIImageView(frame: CGRectMake(0, 0, 30, 30))
        imgView.image = UIImage(named: "exam.png")
        contentView.addSubview(imgView);
        
        titleLabel = UILabel(frame: CGRectMake(0, 0, frame.size.width, frame.size.height))
        titleLabel.textAlignment = .left;
        titleLabel.textColor = UIColor.lightGray;
        titleLabel.font = UIFont.systemFont(ofSize: 15);
        titleLabel.text = "心灵鸡汤，每天一起干"
        contentView.addSubview(titleLabel)
        
        button = UIButton(type: .custom)
        button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        button.setTitle("关注", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.gray
        contentView.addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.text = titleStr
        snapKitAddConstraints()
//        singleItemAddConstraints()
    }
    
    func snapKitAddConstraints() {
        imgView.snp.makeConstraints({ (make) in
            make.top.left.equalTo(15)
            make.width.height.equalTo(50)
        })
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.top)
            make.leading.equalTo(imgView.snp.trailing).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(15)
        }
        button.snp.makeConstraints { (make) in
            make.top.equalTo(imgView.snp.top)
            make.leading.equalTo(titleLabel.snp.trailing).offset(120)
            make.width.equalTo(45)
            make.height.equalTo(30)
        }
    }
    
    func singleItemAddConstraints() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        var cn = NSLayoutConstraint(item: imgView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1.0, constant: 15)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: imgView, attribute: .left, relatedBy: .equal, toItem: contentView, attribute: .left, multiplier: 1.0, constant: 15)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: imgView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 50)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: imgView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: imgView, attribute: .top, multiplier: 1.0, constant: 0)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: imgView, attribute: .trailing, multiplier: 1.0, constant: 10)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 100)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 15)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: imgView, attribute: .top, multiplier: 1.0, constant: 0)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: titleLabel, attribute: .trailing, multiplier: 1.0, constant: 120)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: 45)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 30)
        contentView.addConstraint(cn)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
