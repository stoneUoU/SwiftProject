//
//  HiSettingViewController.swift
//  SwiftProject
//
//  Created by stone on 2025/10/21.
//

import UIKit
import MBProgressHUD

class HiSettingViewController: HiBaseViewController {

    var loginHandle:((_ isSuccess:Bool)->Void)?
    
    @objc lazy var registerButton: UIButton = {
        let registerButton = UIButton.init(type: UIButton.ButtonType.custom)
        registerButton.setTitle("设 置 页", for: UIControl.State.normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.tag = 0;
        registerButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return registerButton
    }()
    
    @objc lazy var openButton: UIButton = {
        let openButton = UIButton.init(type: UIButton.ButtonType.custom)
        openButton.setTitle("退出 登录", for: UIControl.State.normal)
        openButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        openButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
        openButton.layer.borderWidth = 0.5;
        openButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
        openButton.layer.cornerRadius = 20;
        openButton.layer.masksToBounds = true;
        openButton.tag = 1;
        openButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return openButton
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
        self.setStatusAndNavigationUI(centerLabelTitle: "设置", rightButtonTitle: "",ifWhiteIMV:false,navigationColor:.white,centerLabelColor:.black,ifLine: true);
        self.view.addSubview(self.registerButton)
        self.view.addSubview(self.openButton)
        self.setMas();
    }
    
    func setMas() {
        self.registerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(-72)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.openButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view).offset(72)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
        debugPrint("Swift Project");
        
        if (sender.tag == 1) {
            let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
            //纯文本模式
            hud.mode = .indeterminate;
    //        hud.bezelView.backgroundColor = YLZColorTitleTwo;
            //设置提示标题
            hud.label.text = "正在退出，请稍候..."
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                hud.hide(animated: true);
                HiUserDefault.shared.setBool(false, forKey: "ACCESS-TOKEN")
                self.toClose();
                guard let loginHandle = self.loginHandle else { return }
                loginHandle(true);
                HiToast().showToast(text: "退出成功",type: .bottom);
            }
        }
    }
    
    override func toLeft(_ sender :UIButton) {
        self.toClose()
    }
    
    func toClose() {
        self.navigationController?.popViewController(animated: true);
    }
}
