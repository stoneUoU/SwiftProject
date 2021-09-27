//
//  YLZHealthCodeInfoTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

public typealias YLZHealthCodeInfoTableViewCellHandle = (_ clickNum:Int)->Void  //接受Block

class YLZHealthCodeInfoTableViewCell: UITableViewCell {
    
    var isOn:Bool = false
    
    /**
     * 0 : 绿码
     * 1 : 橙码
     * 2 : 红码
     */
    var clickNum:Int = 0;
    var handle:YLZHealthCodeInfoTableViewCellHandle?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorMZTBlueView;
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.picImageView)
        self.bgView.addSubview(self.titleLabel);
        self.bgView.addSubview(self.senderButton)
        self.bgView.addSubview(self.nameLabel)
        self.bgView.addSubview(self.certNoLabel)
        self.bgView.addSubview(self.excuteButton)
        
        self.setMas();
    }
    
    func setMas() {
        self.bgView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.contentView.snp.top).offset(16)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-16)
        }
        self.picImageView.snp.makeConstraints{ (make) in
            make.top.left.equalTo(self.bgView)
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.picImageView)
            make.left.equalTo(self.picImageView.snp.right).offset(12);
        }
        self.senderButton.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.picImageView);
            make.left.equalTo(self.titleLabel.snp.right).offset(12);
        }
        self.nameLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.picImageView.snp.bottom).offset(12);
            make.left.equalTo(self.picImageView.snp.left);
        }
        self.certNoLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(8);
            make.left.equalTo(self.picImageView.snp.left);
        }
        self.excuteButton.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.right.equalTo(self.bgView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 96, height: 36));
        }
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        return bgView
    }()
    lazy var picImageView:UIImageView = {[weak self] in
        var picImageView = UIImageView()
        picImageView.image = UIImage(named: "ylz_mzt_logo_blue")
        return picImageView
    }()
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.medium(size:18)
        titleLabel.textColor = YLZColorWhite
        titleLabel.text = "福建八闽健康码"
        return titleLabel
    }()
    
    lazy var senderButton:UIButton = {[weak self] in
        var senderButton = UIButton(type: .custom)
        senderButton.tag = 0
        senderButton.setImage(UIImage(named: "ylz_eye_hide"), for: .normal)
        senderButton.setTitleColor(YLZColorTitleTwo, for: .normal)
        senderButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return senderButton
    }()
    
    lazy var nameLabel:UILabel = {[weak self] in
        var nameLabel = UILabel()
        nameLabel.font = YLZFont.regular(size:16)
        nameLabel.textColor = YLZColorWhite
        nameLabel.text = "姓名： 彭*晏"
        return nameLabel
    }()
    
    lazy var certNoLabel:UILabel = {[weak self] in
        var certNoLabel = UILabel()
        certNoLabel.font = YLZFont.regular(size:16)
        certNoLabel.textColor = YLZColorWhite
        certNoLabel.text = "身份证号： 362324********5186"
        return certNoLabel
    }()
    
    lazy var excuteButton:UIButton = {[weak self] in
        var excuteButton = UIButton(type: .custom)
        excuteButton.titleLabel?.font = YLZFont.regular(size:14)
        excuteButton.layer.cornerRadius = 18
        excuteButton.layer.masksToBounds = true
        excuteButton.backgroundColor = YLZColorWhite
        excuteButton.setTitleColor(YLZColorMZTBlueView, for: .normal)
        excuteButton.tag = 1
        excuteButton.setTitle("改变颜色", for: .normal)
        excuteButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return excuteButton
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

extension YLZHealthCodeInfoTableViewCell {
    @objc func toOperate(sender: UIButton) {
        if (sender.tag == 0) {
            self.isOn = !self.isOn;
            self.nameLabel.text = self.isOn ? "姓名： 彭于晏":"姓名： 彭*晏";
            self.certNoLabel.text = self.isOn ? "身份证号： 362324199509185186" : "身份证号： 362324********5186";
            self.senderButton.setImage(UIImage.init(named: self.isOn ? "ylz_eye_show" : "ylz_eye_hide"), for: .normal);
        } else {
            self.clickNum = self.clickNum+1;
            if (self.clickNum>2) {
                self.clickNum = 0;
            }
            if (self.handle != nil) {
                self.handle!(self.clickNum);
            }
        }
    }
}


