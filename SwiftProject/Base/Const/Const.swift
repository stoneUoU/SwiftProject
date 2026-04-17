//
//  Const.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

func HiLog<T>(_ message: T, _ file: String = #file, _ line: Int = #line) {
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

public let HiIPhone14Pro = HiSCREENWIDTH == 393 && HiSCREENHEIGHT == 852

public let HiIPhone14ProMax = HiSCREENWIDTH == 430 && HiSCREENHEIGHT == 932

public let isIPhoneX = (HiIPhoneX || HiIPhoneXrMax || HiIPhone12PRO || HiIPhone12Mini || HiIPhone12ProMax || HiIPhone14Pro || HiIPhone14ProMax)

public let HiStatusBarH:CGFloat = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? (isIPhoneX ? 44 : 20)

public let HiNavigationBarH:CGFloat = 44

public let HiTabBarH:CGFloat = (isIPhoneX ? (49+34) : 49)

public let HiTabbarSafeBotM:CGFloat = (isIPhoneX ? (34) : 0)

public let HiStatusBarAndNavigationBarH:CGFloat = (isIPhoneX ? (88) : 64)

let Pos = ToastShowType.bottom

let BASE_URL = "AAAA";

//颜色：
let HiColorRed:UIColor = UIColor.red;
let HiColorWhite:UIColor = UIColor.white;
let HiColorYellow:UIColor = UIColor.yellow;
let HiColorBlack:UIColor = UIColor.black;
let HiColorGreen:UIColor = UIColor.green;
let HiColorBlue:UIColor = UIColor.blue;

/// 背景色
let HiColorBackGround:UIColor = UIColor.color_HexStr("#F5F7FA");
/// 描边颜色/按钮置灰颜色
let HiColorLine:UIColor = UIColor.color_HexStr("#CECECE");

/// 红色
let HiColorRedView:UIColor = UIColor.color_HexStr("#F56C6C");
/// 蓝色
let HiColorBlueView:UIColor = UIColor.color_HexStr("#1B65B9");
/// 淡蓝色
let HiColorLightBlueView:UIColor = UIColor.color_HexStr("#3B71E8");
/// 闽政通淡蓝色
let HiColorMZTBlueView:UIColor = UIColor.color_HexStr("#2171f6");
/// 金色
let HiColorGoldView:UIColor = UIColor.color_HexStr("#E6A23C");
/// 橙色
let HiColorOrangeView:UIColor = UIColor.color_HexStr("#f1985c");

let HiColorView:UIColor = UIColor.color_HexStr("#f4f6f9");

let HiColorPlace:UIColor = UIColor.color_HexStr("#F7F9FD");

/// 标题、正文、辅助文字颜色
let HiColorTitleOne:UIColor = UIColor.color_HexStr("#303133");
let HiColorTitleTwo:UIColor = UIColor.color_HexStr("#606266");
let HiColorTitleThree:UIColor = UIColor.color_HexStr("#909399");
let HiColorTitleFour:UIColor = UIColor.color_HexStr("#C0C4CC");

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
let HiColorDarkBackGround:UIColor = UIColor.color_HexStr("#1a1b1c");

/// 灰色模式下Cell背景色
let HiColorDarkCellBackGround:UIColor = UIColor.color_HexStr("#272829");

/// 灰色模式下Cell背景色
let HiColorSeparator:UIColor = UIColor.color_HexStr("#f0f1f5");

/// Cell的背景色
let HiColorCellBackGround:UIColor = UIColor.color_HexStr("#fafafc");

/// 福建健康码背景
let HiColorRouteCode:UIColor = UIColor.color_HexStr("#e8eaf0");
let HiColorAllInsertCode:UIColor = UIColor.color_HexStr("#f3fcf5");
let HiColorCodeBlue:UIColor = UIColor.color_HexStr("#3a5ddd");
let HiColorCodeButtonbgColor:UIColor = UIColor.color_HexStr("#eceffb");

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor (red: r, green: g, blue: b, alpha: a)
}

let HiAppId = "1544f37522ee43b4ab36d88d08b93c06";
let HiSm4KeySe = "aea510ceb79143c7817f10df0cc77cf8";
let HiPrivateKey = "AMU+eVFp8nkC/UmQryb1QnDSIZdf6/zQVByKN5Rixzws";
