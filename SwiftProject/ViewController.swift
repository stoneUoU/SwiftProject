//
//  ViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit


class ViewController: UIViewController {
    
    @objc lazy var registerButton: UIButton = {
        let registerButton = UIButton.init(type: UIButton.ButtonType.custom)
        registerButton.setTitle("Swift Project", for: UIControl.State.normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.borderWidth = 0.5;
        registerButton.layer.borderColor = UIColor.lightGray.cgColor;
        registerButton.layer.cornerRadius = 20;
        registerButton.layer.masksToBounds = true;
        registerButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return registerButton
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
        
        self.setMas();
    }
    
    func setMas() {
        self.registerButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
    }
}



