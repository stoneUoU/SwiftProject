//
//  CAGradientLayer+Extension.swift
//  OLMovie
//
//  Created by stone on 2020/9/20.
//  Copyright © 2020 Stone. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func noticeViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#3DE5FF").cgColor,UIColor.color_HexStr("#EC8BFF").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func appUpdateViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#7D36D2").cgColor,UIColor.color_HexStr("#D33CFF").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    
    func loginViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#746cff").cgColor,UIColor.color_HexStr("#c003f8").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    
    func buttonViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#c003f8").cgColor,UIColor.color_HexStr("#746cff").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func footerViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#746cff").cgColor,UIColor.color_HexStr("#c003f8").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func announceViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#746cff").cgColor,UIColor.color_HexStr("#c003f8").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func scoreViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#7E76E2").cgColor,UIColor.color_HexStr("#A06DD8").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func commonScoreViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#353143").cgColor,UIColor.color_HexStr("#353143").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func shapeViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#E966A7").cgColor,UIColor.color_HexStr("#F15073").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func accountViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#7E76E2").cgColor,UIColor.color_HexStr("#A06DD8").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func withDrawViewTopLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#7C77E2").cgColor,UIColor.color_HexStr("#9F6ED7").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func withDrawViewTopBgLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#EC8BFF").cgColor,UIColor.color_HexStr("#1E1B2B").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    
    func withDrawViewBottomLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#9F6ED7").cgColor,UIColor.color_HexStr("#7C77E2").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func rechargeViewButtonLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#26DAFB").cgColor,UIColor.color_HexStr("#00B1FF").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func rechargeViewTopToBottomLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#FF6D95").cgColor,UIColor.color_HexStr("#FFC596").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    
    func rechargeViewLeftToRightLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#FF6D95").cgColor,UIColor.color_HexStr("#FFC596").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func mineScoreViewTopToBottomLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#493843").cgColor,UIColor.color_HexStr("#271c31").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    func mineSuperMemberViewTopToBottomLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#2D3237", alpha: 0.93).cgColor,UIColor.color_HexStr("#090A0B", alpha: 0.93).cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 0, y: 1)
        return self
    }
    
    func storeUpgradeAlertViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#F0AF8F").cgColor,UIColor.color_HexStr("#FBDEBF").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func scoreNotEnoughAlertViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#FF9001").cgColor,UIColor.color_HexStr("#FF3A01").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
    
    func underlineFocusViewLayer() -> CAGradientLayer {
        let gradientColors = [UIColor.color_HexStr("#3DE5FF").cgColor,UIColor.color_HexStr("#EC8BFF").cgColor];
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0, 1.0]
        //创建CAGradientLayer对象并设置参数
        self.colors = gradientColors
        self.locations = gradientLocations
        //设置渲染的起始结束位置（横向渐变）
        self.startPoint = CGPoint(x: 0, y: 0)
        self.endPoint = CGPoint(x: 1, y: 0)
        return self
    }
}
