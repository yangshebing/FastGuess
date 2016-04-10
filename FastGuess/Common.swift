//
//  Common.swift
//  FastGuess
//
//  Created by 杨社兵 on 15/10/24.
//  Copyright © 2015年 FAL. All rights reserved.
//

import UIKit
import SnapKit
//system
let kScreenWidth = UIScreen.mainScreen().bounds.width
let kScreenHeight = UIScreen.mainScreen().bounds.height
let IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
let IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0

//color
func RGBA (r:CGFloat, _ g:CGFloat, _ b:CGFloat, _ a:CGFloat) -> UIColor { return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)}

func RGBDec(r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat = 1.0) -> UIColor{
    let color = UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: alpha)
    return color
}

func UIColorFromHexColor(hexColor: Int) ->UIColor {
    return UIColor(red: CGFloat((hexColor & 0xFF0000)>>16)/255.0, green: CGFloat((hexColor&0xFF00)>>8)/255.0, blue: CGFloat(hexColor&0xFF)/255.0, alpha: 1.0)
}

func bMainColor() ->UIColor {
    return UIColorFromHexColor(0x4bc1d2)
}

func bBackGroundColor() -> UIColor {
    return UIColorFromHexColor(0xdedede);
}