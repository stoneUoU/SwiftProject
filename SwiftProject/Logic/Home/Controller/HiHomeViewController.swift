//
//  ViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

class HiHomeViewController: UIViewController {

    @objc lazy var registerButton: UIButton = {
        let registerButton = UIButton.init(type: UIButton.ButtonType.custom)
        registerButton.setTitle("Swift Project", for: UIControl.State.normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.tag = 0;
        registerButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return registerButton
    }()
    
    @objc lazy var hrssButton: UIButton = {
        let hrssButton = UIButton.init(type: UIButton.ButtonType.custom)
        hrssButton.setTitle("掌上12333首页", for: UIControl.State.normal)
        hrssButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        hrssButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
        hrssButton.layer.borderWidth = 0.5;
        hrssButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
        hrssButton.layer.cornerRadius = 20;
        hrssButton.layer.masksToBounds = true;
        hrssButton.tag = 1;
        hrssButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return hrssButton
    }()
    
    @objc lazy var routeButton: UIButton = {
        let routeButton = UIButton.init(type: UIButton.ButtonType.custom)
        routeButton.setTitle("路由码", for: UIControl.State.normal)
        routeButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        routeButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
        routeButton.layer.borderWidth = 0.5;
        routeButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
        routeButton.layer.cornerRadius = 20;
        routeButton.layer.masksToBounds = true;
        routeButton.tag = 2;
        routeButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return routeButton
    }()
    
    @objc lazy var healthButton: UIButton = {
        let healthButton = UIButton.init(type: UIButton.ButtonType.custom)
        healthButton.setTitle("健康码", for: UIControl.State.normal)
        healthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        healthButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
        healthButton.layer.borderWidth = 0.5;
        healthButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
        healthButton.layer.cornerRadius = 20;
        healthButton.layer.masksToBounds = true;
        healthButton.tag = 3;
        healthButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return healthButton
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
        self.view.addSubview(self.registerButton)
        self.view.addSubview(self.hrssButton)
        self.view.addSubview(self.routeButton)
        self.view.addSubview(self.healthButton)
        
        self.setMas();
    }
    
    func setMas() {
        self.registerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.view.snp.top).offset(96)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.hrssButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.registerButton.snp.bottom).offset(64)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.routeButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.hrssButton.snp.bottom).offset(64)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.healthButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.routeButton.snp.bottom).offset(64)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
        debugPrint("Swift Project");
        let tag = sender.tag;
        if (tag == 1) {
            let vc:HrssViewController = HrssViewController();
            self.navigationController?.pushViewController(vc, animated: true);
        } else if (tag == 2) {
            let vc:YLZHealthCodeViewController = YLZHealthCodeViewController();
            self.navigationController?.pushViewController(vc, animated: true);
        } else {
            let vc:YLZRouteCodeViewController = YLZRouteCodeViewController();
            self.navigationController?.pushViewController(vc, animated: true);
        }
    }
}
