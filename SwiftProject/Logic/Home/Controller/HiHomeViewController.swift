//
//  ViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

//#warning ("swift 工程仅作为运行参考，更多示例请参考 OC 工程")
class HiHomeViewController: UIViewController,DCUniMPSDKEngineDelegate {

    let APPID1 = "__UNI__11E9B73"
    
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
        hrssButton.setTitle("首页", for: UIControl.State.normal)
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
    
    @objc lazy var openButton: UIButton = {
        let openButton = UIButton.init(type: UIButton.ButtonType.custom)
        openButton.setTitle("打开Uni小程序", for: UIControl.State.normal)
        openButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        openButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
        openButton.layer.borderWidth = 0.5;
        openButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
        openButton.layer.cornerRadius = 20;
        openButton.layer.masksToBounds = true;
        openButton.tag = 4;
        openButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return openButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI();
        DCUniMPSDKEngine.setDelegate(self)
        self.checkUniMPResoutce(appid: APPID1)
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
        self.view.addSubview(self.openButton)
        
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
            make.top.equalTo(self.registerButton.snp.bottom).offset(54)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.routeButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.hrssButton.snp.bottom).offset(54)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.healthButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.routeButton.snp.bottom).offset(54)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.openButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.healthButton.snp.bottom).offset(54)
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
        } else if (tag == 3) {
            HiLoginHelper.shared.loginWithSuccess(viewController: self) { isSuccess in
                let vc:YLZRouteCodeViewController = YLZRouteCodeViewController();
                self.navigationController?.pushViewController(vc, animated: true);
            }
        } else if (tag == 4) {
            let configuration = DCUniMPConfiguration.init()
            configuration.enableBackground = true;
            configuration.openMode = .push;
            DCUniMPSDKEngine.openUniMP(APPID1, configuration: configuration) { instance, error in
                if instance != nil {
                    print("小程序打开成功")
                } else {
                    print(error as Any)
                }
            }
        }
    }
    
    func checkUniMPResoutce(appid: String) -> Void {
        let wgtPath = Bundle.main.path(forResource: appid, ofType: "wgt") ?? ""
#warning ("注意：isExistsUniMP: 方法判断的仅是运行路径中是否有对应的应用资源，宿主还需要做好内置wgt版本的管理，如果更新了内置的wgt也应该执行 releaseAppResourceToRunPathWithAppid 方法应用最新的资源")
        if DCUniMPSDKEngine.isExistsUniMP(appid) {
            let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
            let name = version["code"]!
            let code = version["code"]!
            print("小程序：\(appid) 资源已存在，版本信息：name:\(name) code:\(code)")
        } else {
            do {
                try DCUniMPSDKEngine.installUniMPResource(withAppid: appid, resourceFilePath: wgtPath, password: nil)
                let version = DCUniMPSDKEngine.getUniMPVersionInfo(withAppid: appid)!
                let name = version["code"]!
                let code = version["code"]!
                print("✅ 小程序：\(appid) 资源释放成功，版本信息：name:\(name) code:\(code)")
            } catch let err as NSError {
                print("❌ 小程序：\(appid) 资源释放失败:\(err)")
            }
        }
    }
}


extension HiHomeViewController {
    
    // MARK: - DCUniMPSDKEngineDelegate
    func uniMP(onClose appid: String) {
        print("小程序：\(appid) closed")
    }
    
    func defaultMenuItemClicked(_ appid: String, identifier: String) {
        print("defaultMenuItemClicked：\(appid) \(identifier)")
    }
    
    func splashView(forApp appid: String) -> UIView {
        let splashView:UIView = HiUniSplashView();
        return splashView
    }
}
