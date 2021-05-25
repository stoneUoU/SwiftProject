//
//  UIColor+Extension.swift
//  InfiniteVPN
//
//  Created by wgf on 2018/3/24.
//  Copyright © 2018年 wgf. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1.0) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
    }
    
    //    扩充构造函数，必须扩充便利构造函数，明确的调用 self.init（）
    convenience init(r:CGFloat,g: CGFloat,b:CGFloat) {
        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
    }
    /// RGB颜色
    ///
    /// - Parameters:
    ///   - r: red  0-255
    ///   - g: green 0-255
    ///   - b: blue 0-255
    /// - Returns: UIColor
    class func RGB (_ r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor {
        return self.RGBA(r, g, b, 1)
    }
    
    class func RGBA (_ r:CGFloat,_ g:CGFloat,_ b:CGFloat,_ a:CGFloat = 1) -> UIColor{
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    /// 16进制颜色字符串转换成RGB颜色
    ///
    /// - Parameter colorStr: String? ,16进制颜色值:(例"9B30FF" 或 "#9B30FF")
    /// - Returns: UIColor
    @objc class func color_HexStr(_ colorStr:String?) -> UIColor {
        return self.color_HexStr(colorStr, alpha: 1)
    }
    @objc class func color_HexStr(_ colorStr:String?, alpha: CGFloat = 1) -> UIColor {
        
        if let color_str = colorStr {
            var color = UIColor.red
            var cStr : String = color_str.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
            
            if cStr.hasPrefix("#") {
                let index = cStr.index(after: cStr.startIndex)
                cStr = cStr.substring(from: index)
            }
            if (cStr as NSString).length != 6 {
                return UIColor.black
            }
            
            let rRange = cStr.startIndex ..< cStr.index(cStr.startIndex, offsetBy: 2)
            let rStr = cStr.substring(with: rRange)
            
            let gRange = cStr.index(cStr.startIndex, offsetBy: 2) ..< cStr.index(cStr.startIndex, offsetBy: 4)
            let gStr = cStr.substring(with: gRange)
            
            let bIndex = cStr.index(cStr.endIndex, offsetBy: -2)
            let bStr = cStr.substring(from: bIndex)
            
            var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
            Scanner(string: rStr).scanHexInt32(&r)
            Scanner(string: gStr).scanHexInt32(&g)
            Scanner(string: bStr).scanHexInt32(&b)
            
            color = UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(alpha))
            
            return color
        }
        return UIColor.black
    }
    public func getRGBValue() -> (CGFloat ,CGFloat,CGFloat) {
        
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        
        //        return (red * 255, green * 255, blue * 255)
        return (red , green , blue )
        
    }
}

