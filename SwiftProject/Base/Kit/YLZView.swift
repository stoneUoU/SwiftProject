//
//  YLZView.swift
//  SwiftProject
//
//  Created by stone on 2021/9/27.
//

import UIKit

class YLZView: NSObject {
    
    //MARK:- 绘制虚线
    /**
     * 绘制虚线
     */
    class func drawLine(imageView: UIImageView, withDashColor dashColor: UIColor) {
        //  Converted to Swift 5.5 by Swiftify v5.5.22923 - https://swiftify.com/
        UIGraphicsBeginImageContext(imageView.frame.size) //开始画线 划线的frame
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: imageView.frame.size.height))
        //设置线条终点形状
        UIGraphicsGetCurrentContext()?.setLineCap(.round)
        
        //  Converted to Swift 5.5 by Swiftify v5.5.22923 - https://swiftify.com/
        let line = UIGraphicsGetCurrentContext()
        // 设置颜色
        line?.setStrokeColor(dashColor.cgColor)
        let lengths:[CGFloat] = [5, 2] //先画4个点再画2个点
        line?.setLineDash(phase: 0, lengths: lengths);
        line?.move(to: CGPoint(x: 0.0, y: 2.0)) //开始画线
        line?.addLine(to: CGPoint(x: imageView.frame.size.width, y: 2.0))
        line?.strokePath()
        // UIGraphicsGetImageFromCurrentImageContext()返回的就是image
        let image = UIGraphicsGetImageFromCurrentImageContext()
        imageView.image = image
    }
}
