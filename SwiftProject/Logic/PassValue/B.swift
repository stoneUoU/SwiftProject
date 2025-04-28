//
//  B.swift
//  SwiftProject
//
//  Created by stone on 2024/5/21.
//

import UIKit

class B: UIViewController {
    
    var logicHandle:((_ str:String)->Void)?

    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size: 22)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "Swift 传 值 测 试 - B 界 面";
        titleLabel.textAlignment = .center;
        return titleLabel
    }()
    
    @objc lazy var doButton: UIButton = {
        let doButton = UIButton.init(type: UIButton.ButtonType.custom)
        doButton.setTitle("返回A界面", for: UIControl.State.normal)
        doButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        doButton.setTitleColor(.black, for: .normal)
        doButton.layer.borderWidth = 0.5;
        doButton.layer.borderColor = UIColor.lightGray.cgColor;
        doButton.layer.cornerRadius = 20;
        doButton.layer.masksToBounds = true;
        doButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return doButton
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
        self.view.addSubview(self.doButton)
        self.view.addSubview(self.titleLabel)
        self.setMas();
    }
    
    func setMas() {
        self.doButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.doButton.snp.top).offset(-54)
            make.size.equalTo(CGSize.init(width: 320, height: 40))
        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true);
        guard let logicHandle = logicHandle else { return }
        logicHandle("传给A界面的值");
    }
}
