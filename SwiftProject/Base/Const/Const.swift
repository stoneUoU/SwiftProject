//
//  Const.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

func YLZLog<T>(_ message: T, _ file: String = #file, _ line: Int = #line) {
    #if DEBUG
        print("\((file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")):\(line):\(message)")
    #endif
}

public let HiSCREENBOUNDS = UIScreen.main.bounds
public let HiSCREENWIDTH = HiSCREENBOUNDS.width
public let HiSCREENHEIGHT = HiSCREENBOUNDS.height

public let HiIPhoneX = HiSCREENWIDTH == 375 && HiSCREENHEIGHT == 812

public let HiIPhoneXrMax = HiSCREENWIDTH == 414 && HiSCREENHEIGHT == 896

public let HiIPhonePlus = HiSCREENWIDTH == 414 && HiSCREENHEIGHT == 736

public let HiIPhone8 = HiSCREENWIDTH == 375 && HiSCREENHEIGHT == 667

public let HiIPhoneSe = HiSCREENWIDTH == 320 && HiSCREENHEIGHT == 568

public let HiIPhone12PRO = HiSCREENWIDTH == 390 && HiSCREENHEIGHT == 844

public let HiIPhone12Mini = HiSCREENWIDTH == 360 && HiSCREENHEIGHT == 780

public let HiIPhone12ProMax = HiSCREENWIDTH == 428 && HiSCREENHEIGHT == 926

public let isIPhoneX = (HiIPhoneX || HiIPhoneXrMax || HiIPhone12PRO || HiIPhone12Mini || HiIPhone12ProMax)

public let HiStatusBarH:CGFloat = (isIPhoneX ? 44 : 20)

public let HiNavigationBarH:CGFloat = 44

public let HiTabBarH:CGFloat = (isIPhoneX ? (49+34) : 49)

public let HiTabbarSafeBotM:CGFloat = (isIPhoneX ? (34) : 0)

public let HiStatusBarAndNavigationBarH:CGFloat = (isIPhoneX ? (88) : 64)

let Pos = ToastShowType.bottom

let BASE_URL = "AAAA";

//颜色：
let YLZColorRed:UIColor = UIColor.red;
let YLZColorWhite:UIColor = UIColor.white;
let YLZColorYellow:UIColor = UIColor.yellow;
let YLZColorBlack:UIColor = UIColor.black;
let YLZColorGreen:UIColor = UIColor.green;
let YLZColorBlue:UIColor = UIColor.blue;

/// 背景色
let YLZColorBackGround:UIColor = UIColor.color_HexStr("#F5F7FA");
/// 描边颜色/按钮置灰颜色
let YLZColorLine:UIColor = UIColor.color_HexStr("#CECECE");

/// 红色
let YLZColorRedView:UIColor = UIColor.color_HexStr("#F56C6C");
/// 蓝色
let YLZColorBlueView:UIColor = UIColor.color_HexStr("#1B65B9");
/// 淡蓝色
let YLZColorLightBlueView:UIColor = UIColor.color_HexStr("#3B71E8");
/// 闽政通淡蓝色
let YLZColorMZTBlueView:UIColor = UIColor.color_HexStr("#2171f6");
/// 金色
let YLZColorGoldView:UIColor = UIColor.color_HexStr("#E6A23C");
/// 橙色
let YLZColorOrangeView:UIColor = UIColor.color_HexStr("#f1985c");

let YLZColorView:UIColor = UIColor.color_HexStr("#f4f6f9");

let YLZColorPlace:UIColor = UIColor.color_HexStr("#F7F9FD");

/// 标题、正文、辅助文字颜色
let YLZColorTitleOne:UIColor = UIColor.color_HexStr("#303133");
let YLZColorTitleTwo:UIColor = UIColor.color_HexStr("#606266");
let YLZColorTitleThree:UIColor = UIColor.color_HexStr("#909399");
let YLZColorTitleFour:UIColor = UIColor.color_HexStr("#C0C4CC");

//背景色
let colorBg:UIColor = UIColor.color_HexStr("#F5F7FA");
let colorBgWhite:UIColor = UIColor.color_HexStr("#ffffff");

//主色、主灰色
let colorMain:UIColor = UIColor.color_HexStr("#1B65B9");
let colorMainGray:UIColor = UIColor.color_HexStr("#edf3fe");

//辅色
let colorSecondary1:UIColor = UIColor.color_HexStr("#20d06a");
let colorSecondary2:UIColor = UIColor.color_HexStr("#F56C6C");
let colorSecondary3:UIColor = UIColor.color_HexStr("#3B71E8");

//辅灰色
let colorSecondaryGray1:UIColor = UIColor.color_HexStr("#ebfcf2");
let colorSecondaryGray2:UIColor = UIColor.color_HexStr("#fcf3eb");
let colorSecondaryGray3:UIColor = UIColor.color_HexStr("#3CA0F6");

//灰色
let colorBlack:UIColor = UIColor.color_HexStr("#000000");
let colorDarkGray:UIColor = UIColor.color_HexStr("#999999");
let colorGray:UIColor = UIColor.color_HexStr("#cccccc");

let colorLightGray:UIColor = UIColor.color_HexStr("#dddddd");
let colorWhiteGray:UIColor = UIColor.color_HexStr("#CECECE");
let colorWhite:UIColor = UIColor.color_HexStr("#ffffff");

//文字灰色
let colorTextBlack:UIColor = UIColor.color_HexStr("#303133");//黑色
let colorTextDarkGray:UIColor = UIColor.color_HexStr("#606266");//灰黑色
let colorTextGray:UIColor = UIColor.color_HexStr("#909399");//灰色
let colorTextLightGray:UIColor = UIColor.color_HexStr("#dddddd");//浅灰色

let colorLine:UIColor = UIColor.color_HexStr("#C0C4CC");

let colorHalfVisible:UIColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.7);

let colorTransparent:UIColor = UIColor.init(red:1.0, green:1.0, blue:1.0, alpha: 0.1);

let colorClear:UIColor = UIColor.clear;

/// 灰色模式下背景色
let YLZColorDarkBackGround:UIColor = UIColor.color_HexStr("#1a1b1c");

/// 灰色模式下Cell背景色
let YLZColorDarkCellBackGround:UIColor = UIColor.color_HexStr("#272829");

/// 灰色模式下Cell背景色
let YLZColorSeparator:UIColor = UIColor.color_HexStr("#f0f1f5");

/// Cell的背景色
let YLZColorCellBackGround:UIColor = UIColor.color_HexStr("#fafafc");

/// 福建健康码背景
let YLZColorRouteCode:UIColor = UIColor.color_HexStr("#e8eaf0");
let YLZColorAllInsertCode:UIColor = UIColor.color_HexStr("#f3fcf5");
let YLZColorCodeBlue:UIColor = UIColor.color_HexStr("#3a5ddd");
let YLZColorCodeButtonbgColor:UIColor = UIColor.color_HexStr("#eceffb");
