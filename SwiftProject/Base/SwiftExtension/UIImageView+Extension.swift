//
//  UIImageView+Extension.swift
//  OLMovie
//
//  Created by stone on 2020/1/10.
//  Copyright © 2020 Stone. All rights reserved.
//

import UIKit

extension UIImageView {
    
    private struct AssociatedKeys {
        static var sectionIndex = "st_sectionIndex"
        static var rowIndex = "st_rowIndex"
    }
    
    var sectionIndex: Int {
        get {
            return (objc_getAssociatedObject(self, &AssociatedKeys.sectionIndex) as! Int)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.sectionIndex, newValue as Int, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var rowIndex: Int {
        get {
            return (objc_getAssociatedObject(self, &AssociatedKeys.rowIndex) as! Int)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.rowIndex, newValue as Int, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    
}
