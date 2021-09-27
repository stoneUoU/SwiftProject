//
//  YLZHealthCodeCheckTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

class YLZHealthCodeCheckTableViewCell: UITableViewCell {
    
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
        self.bgView.addSubview(self.titleLabel)
        self.bgView.addSubview(self.isCheckLabel);
        self.bgView.addSubview(self.excuteButton);
        
        self.setMas();
    }
    
    func setMas() {
        self.bgView.snp.makeConstraints{ (make) in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.bgView.snp.top).offset(16);
            make.left.equalTo(self.bgView).offset(16);
        }
        self.isCheckLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView.snp.bottom).offset(-16);
            make.left.equalTo(self.bgView).offset(16);
        }
        self.excuteButton.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.right.equalTo(self.bgView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 96, height: 36));
        }
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.backgroundColor = YLZColorWhite;
        bgView.layer.masksToBounds = true;
        bgView.layer.cornerRadius = 10.0;
        bgView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        bgView.layer.shadowOpacity = 1;
        bgView.layer.shadowRadius = 12;
        return bgView
    }()
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.regular(size:18)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "通行大数据行程卡";
        return titleLabel
    }()
    
    lazy var isCheckLabel:YLZPaddingLabel = {[weak self] in
        var isCheckLabel = YLZPaddingLabel()
        isCheckLabel.font = YLZFont.regular(size:14)
        isCheckLabel.textColor = YLZColorTitleThree
        isCheckLabel.text = "今日未核验"
        isCheckLabel.backgroundColor = UIColor.color_HexStr("eff5f3");
        isCheckLabel.paddingTop = 5.0
        isCheckLabel.paddingLeft = 10.0
        isCheckLabel.paddingBottom = 5.0
        isCheckLabel.paddingRight = 10.0
        return isCheckLabel
    }()
    
    lazy var excuteButton:UIButton = {[weak self] in
        var excuteButton = UIButton(type: .custom)
        excuteButton.titleLabel?.font = YLZFont.regular(size:14)
        excuteButton.layer.cornerRadius = 18
        excuteButton.layer.masksToBounds = true
        excuteButton.backgroundColor = YLZColorMZTBlueView
        excuteButton.setTitleColor(YLZColorWhite, for: .normal)
        excuteButton.tag = 0
        excuteButton.setTitle("点击核验", for: .normal)
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

extension YLZHealthCodeCheckTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}

