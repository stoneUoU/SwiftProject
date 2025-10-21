//
//  HiMineViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

class HiMineViewController: UIViewController {

    @objc lazy var registerButton: UIButton = {
        let registerButton = UIButton.init(type: UIButton.ButtonType.custom)
        registerButton.setTitle("个人中心", for: UIControl.State.normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.tag = 0;
        registerButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return registerButton
    }()
    //MARK: lazy load
    lazy var statusView: UIView = {[weak self] in
        let statusView = UIView(frame:.zero)
        return statusView
    }()
    lazy var navigationView: UIView = {[weak self] in
        let navigationView = UIView(frame:.zero)
        return navigationView
    }()
    lazy var msgButton: UIButton = {[weak self] in
        let msgButton = UIButton(type: .custom)
        msgButton.tag = 0
        msgButton.setImage(UIImage(named: "hsa_personal_module_setting"), for: .normal)
        msgButton.setTitleColor(YLZColorTitleTwo, for: .normal)
        msgButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return msgButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI();
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setUI() {
        self.view.backgroundColor = .white;
        self.view.addSubview(self.statusView);
        self.view.addSubview(self.navigationView);
        self.navigationView.addSubview(self.msgButton);
        self.view.addSubview(self.registerButton)
        
        self.setMas();
    }
    
    func setMas() {
        self.statusView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiStatusBarH))
        }
        self.navigationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiNavigationBarH))
        }
        self.msgButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.right.equalTo(self.navigationView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 36, height: 36))
        }
        self.registerButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        
    }
    
    @objc func toExcute(_ sender: UIButton) {
        debugPrint("Swift Project");
        let vc:HiLoginViewController = HiLoginViewController();
        self.navigationController?.pushViewController(vc, animated: true);
    }
    @objc func toOperate(sender: UIButton) {
        let vc:HiSettingViewController = HiSettingViewController();
        vc.loginHandle  = {
            (_ boolean:Bool) -> Void in
            self.tabBarController?.selectedIndex = 0;
         }
        self.navigationController?.pushViewController(vc, animated: true);
    }
}
