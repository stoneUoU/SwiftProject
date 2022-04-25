//
//  YLZRouteCodeCell.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit

class YLZRouteCodeCell: UITableViewCell {
    
    var eyeFlag:Bool = false;
    var nameDesensitizationString:String = "*磊";
    var certDesensitizationString:String = "362324********6010";
    var nameString:String = "林磊";
    var certString:String = "362324199610016010";
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorRouteCode;
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.infoView)
        self.infoView.addSubview(self.eyeButton);
        self.infoView.addSubview(self.nameLabel);
        self.infoView.addSubview(self.certLabel);
        self.infoView.addSubview(self.familyIconImageView);
        self.infoView.addSubview(self.familyCodeLabel);
        self.infoView.addSubview(self.dashImageView);
        
        self.setMas();
    }
    
    func setMas() {
        self.infoView.snp.makeConstraints{ (make) in
            make.top.left.right.equalTo(self.bgView);
            make.height.equalTo(76);
        }
        self.familyCodeLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.infoView);
            make.right.equalTo(self.infoView.snp.right).offset(-16);
        }
        self.familyIconImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.infoView);
            make.right.equalTo(self.familyCodeLabel.snp.left).offset(-6);
        }
        self.eyeButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.infoView.snp.top).offset(8);
            make.left.equalTo(self.infoView.snp.left).offset(16);
        }
        self.nameLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.eyeButton);
            make.left.equalTo(self.eyeButton.snp.right).offset(6);
        }
        self.certLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.infoView.snp.bottom).offset(-8);
            make.left.equalTo(self.infoView.snp.left).offset(16);
        }
        self.dashImageView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.infoView);
            make.left.equalTo(self.infoView.snp.left).offset(16);
            make.right.equalTo(self.infoView.snp.right).offset(-16);
            make.height.equalTo(2);
        }
        self.dashImageView.layoutIfNeeded();
        YLZView.drawLine(imageView: self.dashImageView, withDashColor: YLZColorTitleThree);
//        self.separatorView.snp.makeConstraints{ (make) in
//            make.bottom.equalTo(self.bgView);
//            make.height.equalTo(0.5);
//            make.left.equalTo(self.iconImageView.snp.left)
//            make.right.equalTo(self.bgView.snp.right).offset(-16)
//        }
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 24, y: 0, width: SCREENWIDTH - 48, height: 480)
        bgView.backgroundColor = YLZColorWhite;
        bgView.layer.masksToBounds = true;
        bgView.layer.cornerRadius = 12.0;
        bgView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        bgView.layer.shadowOpacity = 1;
        bgView.layer.shadowRadius = 12;
        return bgView
    }()
    
    lazy var infoView:UIView = {[weak self] in
        let infoView = UIView()
        return infoView
    }()
    
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
        return familyCodeLabel
    }()
    
    lazy var familyIconImageView:UIImageView = {[weak self] in
        var familyIconImageView = UIImageView()
        familyIconImageView.image = UIImage.init(named: "ylz_qrcode_bright")
        return familyIconImageView
    }()
    
    lazy var dashImageView:UIImageView = {[weak self] in
        var dashImageView = UIImageView()
        return dashImageView
    }()
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size: 18)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "";
        return titleLabel
    }()
    
    lazy var separatorView:UIView = {[weak self] in
        var separatorView = UIView()
        separatorView.backgroundColor = YLZColorLine;
        return separatorView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension YLZRouteCodeCell {
    @objc func toOperate(sender: UIButton) {
        self.eyeFlag = !self.eyeFlag;
        self.nameLabel.text = self.eyeFlag ? self.nameDesensitizationString : self.nameString;
        self.certLabel.text = self.eyeFlag ? self.certDesensitizationString : self.certString;
    }
}


