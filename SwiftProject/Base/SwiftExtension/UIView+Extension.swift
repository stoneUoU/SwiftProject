//
//  UIView+Extension.swift
//  OLMovie
//
//  Created by stone on 2019/9/24.
//  Copyright © 2019 Stone. All rights reserved.
//

import UIKit

public extension UIView {

    var x : CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }

    var y : CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }

    var width : CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }

    var height : CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }

    var origin : CGPoint {
        get {
            return self.frame.origin
        }
        set {
            self.frame.origin = newValue
        }
    }
    var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.frame.size = newValue
        }
    }
}
public extension UIView {

    var top : CGFloat {
        get {
            return self.y
        }
        set {
            self.y = newValue
        }
    }

    var left : CGFloat {
        get {
            return self.x
        }
        set {
            self.x = newValue
        }
    }

    var bottom : CGFloat {
        get {
            return self.y + self.height
        }
        set {
            self.y = newValue - self.height
        }
    }

    var right : CGFloat {
        get {
            return self.x + self.width
        }
        set {
            self.x = newValue - self.width
        }
    }

    var centerX : CGFloat {
        get {
            return self.center.x
        }
        set {
            self.center = CGPoint(x: newValue, y: self.center.y)
        }
    }

    var centerY : CGFloat {
        get {
            return self.center.y
        }
        set {
            self.center = CGPoint(x: self.center.x, y: newValue)
        }
    }
    //设置圆角
    func setCornerRadius(cornerRadius:CGFloat, masksToBounds:Bool = true){
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = masksToBounds
    }
    //设置阴影
    //预设一组常用的参数
    func setShadow(color:CGColor = UIColor.lightGray.cgColor,
                          offset:CGSize = CGSize(width: 2, height: 2),
                          radius:CGFloat = 5,
                          opacity:Float = 1){
        self.layer.shadowColor = color
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
    }
}

public extension UIScreen {

    public class var width : CGFloat {
        get {
            return UIScreen.main.bounds.size.width
        }
    }

    public class var height : CGFloat {
        get {
            return UIScreen.main.bounds.size.height
        }
    }

}
