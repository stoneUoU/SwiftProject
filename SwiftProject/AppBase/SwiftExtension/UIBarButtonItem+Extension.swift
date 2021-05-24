//
//  UIBarButtonItem+Extension.swift
//  Wisdom
//
//  Created by wgf on 2018/4/9.
//  Copyright © 2018年 wgf. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    /// 快速创建导航条按钮
    ///
    /// - Parameters:
    ///   - imageName: 默认图片名称
    ///   - hImageName: 高亮图片名称
    ///   - isLeft: 是否是左边还是右边, 默认左边, false代表右边
    convenience init(imageName: String, hImageName: String? = nil, _ isLeft: Bool = true, target: Any?, action: Selector) {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        if let h = hImageName {
            button.setImage(UIImage(named: h), for: .highlighted)
        }
        button.sizeToFit()
        
        isLeft ? (button.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)) : (button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10))
        self.init(customView: button)
    }
    
}
