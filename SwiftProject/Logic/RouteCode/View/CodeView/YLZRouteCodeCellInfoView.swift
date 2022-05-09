//
//  YLZRouteCodeCellInfoView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/25.
//

import UIKit

typealias YLZRouteCodeCellInfoViewHandle = () -> Void

protocol YLZRouteCodeCellInfoViewDelegate: AnyObject {
    func toExcute(view:YLZRouteCodeCellInfoView)
}

class YLZRouteCodeCellInfoView: UIView {
    
    var eyeFlag:Bool = false;
    var nameDesensitizationString:String = "*磊";
    var certDesensitizationString:String = "362324********6010";
    var nameString:String = "林磊";
    var certString:String = "362324199610016010";
    
    var handle:YLZRouteCodeCellInfoViewHandle?
    weak var routeCodeCellInfoViewDelegate : YLZRouteCodeCellInfoViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(self.eyeButton);
        self.addSubview(self.nameLabel);
        self.addSubview(self.certLabel);
        self.addSubview(self.familyIconImageView);
        self.addSubview(self.familyCodeLabel);
        self.addSubview(self.dashImageView);
        self.setMas();
    }
    
    func setMas() {
        self.familyCodeLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self);
            make.right.equalTo(self.snp.right).offset(-16);
        }
        self.familyIconImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self);
            make.right.equalTo(self.familyCodeLabel.snp.left).offset(-6);
        }
        self.eyeButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.snp.top).offset(8);
            make.left.equalTo(self.snp.left).offset(16);
        }
        self.nameLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.eyeButton);
            make.left.equalTo(self.eyeButton.snp.right).offset(6);
        }
        self.certLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.snp.bottom).offset(-8);
            make.left.equalTo(self.snp.left).offset(16);
        }
        YLZView.drawLine(imageView: self.dashImageView, withDashColor: YLZColorTitleThree);
    }
    lazy var eyeButton: UIButton = {[weak self] in
        let eyeButton = UIButton(type: .custom)
        eyeButton.tag = 0
        eyeButton.setImage(UIImage(named: "ylz_route_eye_close"), for: .normal)
        eyeButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return eyeButton
    }()
    lazy var nameLabel:UILabel = {[weak self] in
        var nameLabel = UILabel()
        nameLabel.font = YLZFont.medium(size: 20)
        nameLabel.textColor = YLZColorTitleOne
        nameLabel.text = self?.nameDesensitizationString;
        return nameLabel
    }()
    lazy var certLabel:UILabel = {[weak self] in
        var certLabel = UILabel()
        certLabel.font = YLZFont.medium(size: 18);
        certLabel.textColor = YLZColorTitleTwo
        certLabel.text = self?.certDesensitizationString;
        return certLabel
    }()
    lazy var familyCodeLabel:UILabel = {[weak self] in
        var familyCodeLabel = UILabel()
        familyCodeLabel.font = YLZFont.bold(size: 16);
        familyCodeLabel.textColor = YLZColorCodeBlue
        familyCodeLabel.text = "亲友亮码";
        familyCodeLabel.isUserInteractionEnabled = true;
        let recognizer:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self?.toRecognizer(_:)));
        familyCodeLabel.addGestureRecognizer(recognizer);
        return familyCodeLabel
    }()
    
    lazy var familyIconImageView:UIImageView = {[weak self] in
        var familyIconImageView = UIImageView()
        familyIconImageView.image = UIImage.init(named: "ylz_qrcode_bright")
        return familyIconImageView
    }()
    
    lazy var dashImageView:UIImageView = {[weak self] in
        var dashImageView = UIImageView()
        dashImageView.frame = CGRect.init(x: 16, y: 74, width: HiSCREENWIDTH - (48+32), height: 2)
        return dashImageView
    }()
}

extension YLZRouteCodeCellInfoView {
    
    @objc func toRecognizer(_ sender :UITapGestureRecognizer) {
        if (self.handle != nil) {
            self.handle!();
        }
//        self.routeCodeCellInfoViewDelegate?.toExcute(view:self);
    }
    
    @objc func toOperate(sender: UIButton) {
        self.eyeFlag = !self.eyeFlag;
        self.nameLabel.text = self.eyeFlag ? self.nameDesensitizationString : self.nameString;
        self.certLabel.text = self.eyeFlag ? self.certDesensitizationString : self.certString;
        self.eyeButton.setImage(UIImage(named: self.eyeFlag ? "ylz_route_eye_close" : "ylz_route_eye_open"), for: .normal)
    }
}



