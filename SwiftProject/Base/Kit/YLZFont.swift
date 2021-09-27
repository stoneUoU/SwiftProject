//
//  YLZFont.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

class YLZFont: NSObject {
    
    static func regular(size:Float) -> UIFont {
        let font = UIFont(name: "PingFangSC-Regular", size: CGFloat(size))
        if (font != nil) {
            return font!;
        }
        return self.defaultFont(size:size);
    }
    
    static func bold(size:Float) -> UIFont {
        let font = UIFont(name: "PingFangSC-Semibold", size: CGFloat(size))
        if (font != nil) {
            return font!;
        }
        return self.defaultFont(size:size);
    }
    
    static func light(size:Float) -> UIFont {
        let font = UIFont(name: "PingFangSC-Light", size: CGFloat(size))
        if (font != nil) {
            return font!;
        }
        return self.defaultFont(size:size);
    }
    
    static func medium(size:Float) -> UIFont {
        let font = UIFont(name: "PingFangSC-Medium", size: CGFloat(size))
        if (font != nil) {
            return font!;
        }
        return self.defaultFont(size:size);
    }
    
    static func defaultFont(size:Float) -> UIFont {
        
        return UIFont.systemFont(ofSize: CGFloat(size));
    }
}
