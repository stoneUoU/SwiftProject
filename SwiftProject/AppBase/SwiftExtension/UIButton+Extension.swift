//
//  UIButton+Extension.swift
//  OLMovie
//
//  Created by stone on 2019/8/23.
//  Copyright © 2019 wgf. All rights reserved.
//


import UIKit
private var key: Void?
public extension UIButton {
    //未UIbutton添加一个存储属性，便于传参
    enum ButtonImagePosition : Int{
        
        case PositionTop = 0
        case Positionleft
        case PositionBottom
        case PositionRight
    }
    var strBtn: String? {
        get {
            return objc_getAssociatedObject(self, &key) as? String
        }
        set(newValue) {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    func setImageAndTitle(imageName:String,title:String,type:ButtonImagePosition,Space space:CGFloat)  {
        
        self.setTitle(title, for: .normal)
        self.setImage(UIImage(named:imageName), for: .normal)
        
        let imageWith :CGFloat = (self.imageView?.frame.size.width)!;
        let imageHeight :CGFloat = (self.imageView?.frame.size.height)!;
        
        var labelWidth :CGFloat = 0.0;
        var labelHeight :CGFloat = 0.0;
        
        labelWidth = CGFloat(self.titleLabel!.intrinsicContentSize.width);
        labelHeight = CGFloat(self.titleLabel!.intrinsicContentSize.height);
        
        var  imageEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        var  labelEdgeInsets :UIEdgeInsets = UIEdgeInsets();
        
        switch type {
        case .PositionTop:
            imageEdgeInsets = UIEdgeInsets(top: -labelHeight - space/2.0, left: 0, bottom: 0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space/2.0, right: 0);
            break;
        case .Positionleft:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0);
            break;
        case .PositionBottom:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth);
            labelEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0, right: 0);
            break;
        case .PositionRight:
            imageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth+2*space/2.0);
            labelEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-2*space/2.0, bottom: 0, right: imageWith+space/2.0);
            break;
        }
        
        // 4. 赋值
        self.titleEdgeInsets = labelEdgeInsets;
        self.imageEdgeInsets = imageEdgeInsets;
    }
    
}
extension UIButton {
    
    private struct AssociatedKeys {
        static var sectionIndex = "st_sectionIndex"
        static var rowIndex = "st_rowIndex"
        static var indexPath = "st_indexPath"
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
    
    var indexPath: NSIndexPath {
        get {
            return (objc_getAssociatedObject(self, &AssociatedKeys.indexPath) as! NSIndexPath)
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.indexPath, newValue as NSIndexPath, .OBJC_ASSOCIATION_COPY)
        }
    }
}

extension UIButton {
    /**
     * setCornerRadius   给view设置圆角
     * @param value      圆角大小
     * @param rectCorner 圆角位置
     **/
    
    func setCornerRadius(_ value: CGFloat, addRectCorners rectCorner: UIRectCorner) {
        
        self.layoutIfNeeded() //这句代码很重要，不能忘了
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: value, height: value))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
    
    func setCornerRadiusWithBounds(_ value: CGFloat, addRectCorners rectCorner: UIRectCorner,bounds:CGRect) {
        
        self.layoutIfNeeded() //这句代码很重要，不能忘了
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: value, height: value))
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
