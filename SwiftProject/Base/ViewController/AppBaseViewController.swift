//
//  AppBaseViewController.swift
//  AppManage
//
//  Created by stone on 2021/5/22.
//

import UIKit
import SnapKit

class AppBaseViewController: UIViewController,UIGestureRecognizerDelegate {

    var statusView = UIView()
    var navigationView = UIView()
    var centerLabel = UILabel()
    var leftButton = UIButton()
    var rightButton = UIButton()
    var lineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let GesTar = self.navigationController?.interactivePopGestureRecognizer!.delegate
        let Ges = UIPanGestureRecognizer(target:GesTar,
                                         action:Selector(("handleNavigationTransition:")))
        Ges.delegate = self
        self.view.addGestureRecognizer(Ges)
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

extension AppBaseViewController {
    
    func setStatusAndNavigationUI(centerLabelTitle:String,rightButtonTitle:String,ifWhiteIMV:Bool = true,navigationColor:UIColor = .black,centerLabelColor:UIColor = .white,rightButtonColor:UIColor = .white,ifLine:Bool = false) {
        
        self.statusView.backgroundColor = navigationColor
        self.view.addSubview(self.statusView)
        
        self.navigationView.backgroundColor = navigationColor
        self.view.addSubview(self.navigationView)
        
        self.leftButton = UIButton()
        self.leftButton.setImage(ifWhiteIMV == true ? UIImage(named: "back_white.png") : UIImage(named: "nav_back.png"), for:.normal);
        self.leftButton.addTarget(self, action:#selector(self.toLeft(_:)), for:.touchUpInside)
//        self.leftButton.fitSize(toBtn: CGSize.init(width: 15, height: 15))
        self.navigationView.addSubview(self.leftButton)
        self.centerLabel.text = centerLabelTitle
        self.centerLabel.textAlignment = .center
        self.centerLabel.textColor = centerLabelColor
        self.navigationView.addSubview(self.centerLabel)
        self.rightButton = UIButton()
        self.rightButton.setTitle(rightButtonTitle, for:.normal)
        self.rightButton.setTitleColor(rightButtonColor, for: .normal)
        self.rightButton.titleLabel!.font = UIFont.systemFont(ofSize: 16)
        self.rightButton.addTarget(self, action:#selector(self.toRight(_:)), for:.touchUpInside)
        self.rightButton.contentHorizontalAlignment = .center
        self.navigationView.addSubview(self.rightButton)
        
        self.setStatusAndNavigationMas(ifLine: ifLine)
        
    }
    
    func setStatusAndNavigationMas(ifLine:Bool) {
        self.statusView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: SCREENWIDTH, height: StatusBarH))
        }
        self.navigationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: SCREENWIDTH, height: NavigationBarH))
        }
        self.leftButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.left.equalTo(self.navigationView.snp.left).offset(10)
        }
        self.centerLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.navigationView)
            make.width.equalTo(2*SCREENWIDTH/3)
        }
        self.rightButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.height.equalTo(NavigationBarH)
            make.right.equalTo(-15)
        }
        if ifLine == true {
            self.lineView.backgroundColor = UIColor.gray;
            self.navigationView.addSubview(self.lineView)
            self.lineView.snp.makeConstraints { (make) in
                make.bottom.equalTo(self.navigationView.snp.bottom).offset(0)
                make.height.equalTo(CGFloat(0.7))
                make.width.equalTo(SCREENWIDTH)
            }
        }
    }
    //手势代码：
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if self.navigationController?.viewControllers.count == 1 {
            return false
        }
        return true
    }
    @objc func toLeft(_ sender :UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func toRight(_ sender :UIButton){
        STLog("等继承者来完成相应功能")
    }
    
}
