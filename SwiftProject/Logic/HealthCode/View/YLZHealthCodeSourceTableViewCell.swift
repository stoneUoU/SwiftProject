//
//  YLZHealthCodeSourceTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

class YLZHealthCodeSourceTableViewCell: UITableViewCell {
    
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
        self.bgView.addSubview(self.leftOneLabel);
        self.bgView.addSubview(self.rightOneLabel);
        
        self.bgView.addSubview(self.leftTwoLabel);
        self.bgView.addSubview(self.rightTwoLabel);
        
        self.bgView.addSubview(self.leftThreeLabel);
        self.bgView.addSubview(self.rightThreeLabel);
        
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
        self.leftOneLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16);
            make.left.equalTo(self.bgView).offset(16);
            make.width.equalTo(72);
        }
        self.rightOneLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.leftOneLabel.snp.top);
            make.left.equalTo(self.leftOneLabel.snp.right);
            make.right.equalTo(self.bgView.snp.right).offset(-16);
        }
        self.leftTwoLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.rightOneLabel.snp.bottom).offset(8);
            make.left.equalTo(self.bgView).offset(16);
            make.width.equalTo(72);
        }
        self.rightTwoLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.leftTwoLabel.snp.top);
            make.left.equalTo(self.leftTwoLabel.snp.right);
            make.right.equalTo(self.bgView.snp.right).offset(-16);
        }
        self.leftThreeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.rightTwoLabel.snp.bottom).offset(8);
            make.left.equalTo(self.bgView).offset(16);
            make.width.equalTo(72);
        }
        self.rightThreeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.leftThreeLabel.snp.top);
            make.left.equalTo(self.leftThreeLabel.snp.right);
            make.right.equalTo(self.bgView.snp.right).offset(-16);
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
        titleLabel.font = YLZFont.regular(size:24)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "信息说明";
        return titleLabel
    }()
    
    lazy var leftOneLabel:UILabel = {[weak self] in
        var leftOneLabel = UILabel()
        leftOneLabel.font = YLZFont.regular(size:12)
        leftOneLabel.textColor = YLZColorTitleOne
        leftOneLabel.text = ".数据来源：";
        return leftOneLabel
    }()
    
    lazy var rightOneLabel:UILabel = {[weak self] in
        var rightOneLabel = UILabel()
        rightOneLabel.font = YLZFont.regular(size:12)
        rightOneLabel.textColor = YLZColorTitleOne
        rightOneLabel.textAlignment = .left;
        rightOneLabel.numberOfLines = 0;
        rightOneLabel.text = "国家政务服务平台和福建省相关部门。";
        return rightOneLabel
    }()
    
    lazy var leftTwoLabel:UILabel = {[weak self] in
        var leftTwoLabel = UILabel()
        leftTwoLabel.font = YLZFont.regular(size:12)
        leftTwoLabel.textColor = YLZColorTitleOne
        leftTwoLabel.text = ".注意事项：";
        return leftTwoLabel
    }()
    
    lazy var rightTwoLabel:UILabel = {[weak self] in
        var rightTwoLabel = UILabel()
        rightTwoLabel.font = YLZFont.regular(size:12)
        rightTwoLabel.textColor = YLZColorTitleOne
        rightTwoLabel.textAlignment = .left;
        rightTwoLabel.numberOfLines = 0;
        rightTwoLabel.text = "使用健康码时不要离开本页面且需本人操作确认。";
        return rightTwoLabel
    }()
    
    lazy var leftThreeLabel:UILabel = {[weak self] in
        var leftThreeLabel = UILabel()
        leftThreeLabel.font = YLZFont.regular(size:12)
        leftThreeLabel.textColor = YLZColorTitleOne
        leftThreeLabel.text = ".使用范围：";
        return leftThreeLabel
    }()
    
    lazy var rightThreeLabel:UILabel = {[weak self] in
        var rightThreeLabel = UILabel()
        rightThreeLabel.font = YLZFont.regular(size:12)
        rightThreeLabel.textColor = YLZColorTitleOne
        rightThreeLabel.textAlignment = .left;
        rightThreeLabel.numberOfLines = 0;
        rightThreeLabel.text = "依托国家政务服务平台，实现跨省（区、市）数据共享和互通互认。";
        return rightThreeLabel
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

extension YLZHealthCodeSourceTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}
