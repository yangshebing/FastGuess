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
        titleLabel.textAlignment = .Left;
        titleLabel.textColor = UIColor.lightGrayColor();
        titleLabel.font = UIFont.systemFontOfSize(15);
        titleLabel.text = "心灵鸡汤，每天一起干"
        contentView.addSubview(titleLabel)
        
        button = UIButton(type: .Custom)
        button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        button.setTitle("关注", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = UIColor.grayColor()
        contentView.addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.text = titleStr
        imgView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        var cn = NSLayoutConstraint(item: imgView, attribute: .Top, relatedBy: .Equal, toItem: contentView, attribute: .Top, multiplier: 1.0, constant: 15)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: imgView, attribute: .Left, relatedBy: .Equal, toItem: contentView, attribute: .Left, multiplier: 1.0, constant: 15)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: imgView, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: 50)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: imgView, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 50)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: imgView, attribute: .Top, multiplier: 1.0, constant: 0)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: titleLabel, attribute: .Leading, relatedBy: .Equal, toItem: imgView, attribute: .Trailing, multiplier: 1.0, constant: 10)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: titleLabel, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: 100)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 15)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: imgView, attribute: .Top, multiplier: 1.0, constant: 0)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: button, attribute: .Leading, relatedBy: .Equal, toItem: titleLabel, attribute: .Trailing, multiplier: 1.0, constant: 120)
        contentView.addConstraint(cn)
        
        cn = NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1.0, constant: 45)
        contentView.addConstraint(cn)
        cn = NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .Height, multiplier: 1.0, constant: 30)
        contentView.addConstraint(cn)
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
