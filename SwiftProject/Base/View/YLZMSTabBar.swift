//
//  YLZMSTabBar.swift
//  SwiftProject
//
//  Created by stone on 2021/5/26.
//

import UIKit

typealias YLZMSDidTabBarMiddleBtn = () -> Void

class YLZMSTabBar: UITabBar {
    
    var didTabBarMiddleBtn: YLZMSDidTabBarMiddleBtn?
    
    var tabbarBtnNum:Int = 0;
    
    let middleButtonWidth:CGFloat = 77;
    
    @objc lazy var qrCodeView: UIView = {
        let qrCodeView = UIView.init()
        qrCodeView.isUserInteractionEnabled = true;
        let recognizer:UILongPressGestureRecognizer = UILongPressGestureRecognizer.init(target: self, action: #selector(self.toRecognizer(_:)))
        qrCodeView.addGestureRecognizer(recognizer);
        return qrCodeView
    }()
    
    @objc lazy var qrImageView: UIImageView = {
        let qrImageView = UIImageView.init()
        return qrImageView
    }()
    
    @objc lazy var qrBgImageView: UIImageView = {
        let qrBgImageView = UIImageView.init()
        qrBgImageView.image = UIImage.init(named:"tabbar_middle_cert_shape")
        return qrBgImageView
    }()
    
    @objc lazy var leftShadowView: UIView = {
        let leftShadowView = UIView.init(frame:CGRect.init(x: 0, y: -4, width: (HiSCREENWIDTH - middleButtonWidth)/2, height: 8.0));
        let uiimage:UIImage = UIImage.init(named: "ylz_tabbar_custom_line")!
        leftShadowView.layer.contents = uiimage.cgImage;
        return leftShadowView
    }()
    
    @objc lazy var rightShadowView: UIView = {
        let rightShadowView = UIView.init(frame:CGRect.init(x: (HiSCREENWIDTH - middleButtonWidth)/2+middleButtonWidth, y: -4, width: (HiSCREENWIDTH - middleButtonWidth)/2, height: 8.0));
        let uiimage:UIImage = UIImage.init(named: "ylz_tabbar_custom_line")!
        rightShadowView.layer.contents = uiimage.cgImage;
        return rightShadowView
    }()

    @objc init(frame: CGRect, tabbarBtnNum: Int) {
        super.init(frame: frame)
        self.setUI()
    }
    
    func setUI() {
        self.addSubview(self.qrCodeView)
        self.addSubview(self.leftShadowView)
        self.addSubview(self.rightShadowView)
        
        self.qrCodeView.addSubview(self.qrBgImageView)
        self.qrCodeView.addSubview(self.qrImageView)
        
        self.setMas();
    }
    
    func setMas() {
        self.qrBgImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.qrCodeView.snp.top).offset(20);
            make.centerX.equalTo(self.qrCodeView)
        }
        self.qrImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.qrBgImageView.snp.bottom).offset(-5);
            make.centerX.equalTo(self.qrCodeView).offset(-0.5);
            make.size.equalTo(CGSize.init(width: 72, height: 72));
        }
    }
    
    @objc func toRecognizer(_ sender :UITapGestureRecognizer) {
        if (self.didTabBarMiddleBtn != nil) {
            self.didTabBarMiddleBtn!();
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width: CGFloat = self.frame.size.width / CGFloat(self.tabbarBtnNum);
        let tabBarClass: AnyClass! = self.swiftClassFromString(className: "UITabBarButton");
        for view in subviews {
            if view == qrCodeView {
                view.size = CGSize.init(width: middleButtonWidth, height: HiTabBarH+24)
                view.top = -24
                view.centerX = self.frame.size.width / 2
            } else if view.isKind(of: tabBarClass) {
                let frame = view.frame
                var indexFromOrign:Int = Int(view.frame.origin.x / width)
                if indexFromOrign >= (tabbarBtnNum - 1) / 2 {
                    indexFromOrign += 1
                }
                let x = CGFloat(CGFloat(indexFromOrign) * width)
                view.frame = CGRect(x: x, y: view.frame.origin.y, width: width, height: frame.size.height)
            }
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if !isHidden {
            let newP = convert(point, to: qrCodeView)
            if qrCodeView.point(inside: newP, with: event) {
                return qrCodeView
            } else {
                return super.hitTest(point, with: event)
            }
        } else {
            return super.hitTest(point, with: event)
        }
    }
    
    func swiftClassFromString(className: String) -> AnyClass! {
        // get the project name
        if  let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String? {
            let classStringName = appName + "." + className
            return NSClassFromString(classStringName)
        }
        return nil;
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
