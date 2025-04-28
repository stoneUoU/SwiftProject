//
//  A.swift
//  SwiftProject
//
//  Created by stone on 2024/5/21.
//

import UIKit
import PocketSVG

class A: UIViewController {
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size: 22)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "Swift S v g 测 试 ";
        titleLabel.textAlignment = .center;
        return titleLabel
    }()
    
    lazy var svgImageView:SVGImageView = {[weak self] in
        let url = Bundle.main.url(forResource: "member_plus", withExtension: "svg")!
        let svgImageView = SVGImageView.init(contentsOf: url)
        svgImageView.contentMode = .scaleAspectFit
        return svgImageView
    }()
    
//    @objc lazy var doButton: UIButton = {
//        let doButton = UIButton.init(type: UIButton.ButtonType.custom)
//        doButton.setTitle("去 B 界面", for: UIControl.State.normal)
//        doButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        doButton.setTitleColor(.black, for: .normal)
//        doButton.layer.borderWidth = 0.5;
//        doButton.layer.borderColor = UIColor.lightGray.cgColor;
//        doButton.layer.cornerRadius = 20;
//        doButton.layer.masksToBounds = true;
//        doButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
//        return doButton
//    }()
    
    lazy var displayLabel:UILabel = {[weak self] in
        var displayLabel = UILabel()
        displayLabel.font = YLZFont.bold(size: 16)
        displayLabel.textColor = YLZColorTitleOne;
        displayLabel.textAlignment = .center;
        return displayLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI();
    }
    
    func setUI() {
        self.view.backgroundColor = .white;
//        self.view.addSubview(self.doButton)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.svgImageView)
        self.view.addSubview(self.displayLabel)
        self.setMas();
    }
    
    func setMas() {
//        self.doButton.snp.makeConstraints { (make) in
//            make.center.equalTo(self.view)
//            make.size.equalTo(CGSize.init(width: 240, height: 40))
//        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 320, height: 40))
        }
        self.svgImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(54)
            make.size.equalTo(CGSize.init(width: 120, height: 120))
        }
//        self.displayLabel.snp.makeConstraints { (make) in
//            make.centerX.equalTo(self.view)
//            make.top.equalTo(self.doButton.snp.bottom).offset(54)
//            make.size.equalTo(CGSize.init(width: 320, height: 40))
//        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
        let b = B();
        b.logicHandle =  {
            (_ str:String) -> Void in
            print("收到————————\(str)");
            self.displayLabel.text = str;
        }
        self.navigationController?.pushViewController(b, animated: true);
    }
}
