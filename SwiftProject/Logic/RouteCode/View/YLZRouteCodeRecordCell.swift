//
//  YLZRouteCodeRecordCell.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit

class YLZRouteCodeRecordCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorRouteCode;
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.leftView)
        self.leftView.addSubview(self.iconLeftImageView);
        self.leftView.addSubview(self.titleLeftLabel);
        self.leftView.addSubview(self.subTitleLeftLabel);
        self.leftView.addSubview(self.leftSeparatorView);
        
        self.contentView.addSubview(self.rightView)
        self.rightView.addSubview(self.iconRightImageView);
        self.rightView.addSubview(self.titleRightLabel);
        self.rightView.addSubview(self.subTitleRightLabel);
        self.rightView.addSubview(self.rightSeparatorView);
        
        self.setMas();
    }
    
    func setMas() {
        self.leftView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView.snp.left).offset(24);
            make.size.equalTo(CGSize.init(width: (SCREENWIDTH - 48 - 16)/2, height: 96))
        }
        self.titleLeftLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.leftView.snp.top).offset(8);
            make.left.equalTo(self.leftView.snp.left).offset(16);
        }
        self.leftSeparatorView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.leftView);
            make.left.equalTo(self.leftView.snp.left).offset(12);
            make.size.equalTo(CGSize.init(width:48, height: 0.5))
        }
        self.subTitleLeftLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.leftView.snp.bottom).offset(-12);
            make.left.equalTo(self.leftView.snp.left).offset(16);
        }
        self.iconLeftImageView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.leftView.snp.bottom);
            make.right.equalTo(self.leftView.snp.right);
        }
        
        self.rightView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView.snp.right).offset(-24);
            make.size.equalTo(CGSize.init(width: (SCREENWIDTH - 48 - 16)/2, height: 96))
        }
        self.titleRightLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.rightView.snp.top).offset(8);
            make.left.equalTo(self.rightView.snp.left).offset(16);
        }
        self.rightSeparatorView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.rightView);
            make.left.equalTo(self.rightView.snp.left).offset(12);
            make.size.equalTo(CGSize.init(width:48, height: 0.5))
        }
        self.subTitleRightLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.rightView.snp.bottom).offset(-12);
            make.left.equalTo(self.rightView.snp.left).offset(16);
        }
        self.iconRightImageView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.rightView.snp.bottom);
            make.right.equalTo(self.rightView.snp.right);
        }
    }
    
    lazy var leftView:UIView = {[weak self] in
        let leftView = UIView()
        leftView.backgroundColor = YLZColorWhite;
        leftView.layer.cornerRadius = 12.0;
        leftView.layer.masksToBounds = true;
        return leftView
    }()
    
    lazy var iconLeftImageView:UIImageView = {[weak self] in
        var iconLeftImageView = UIImageView()
        iconLeftImageView.image = UIImage.init(named: "ylz_record_fresh");
        return iconLeftImageView
    }()
    
    lazy var titleLeftLabel:UILabel = {[weak self] in
        var titleLeftLabel = UILabel()
        titleLeftLabel.font = YLZFont.medium(size: 20)
        titleLeftLabel.textColor = YLZColorTitleOne
        titleLeftLabel.text = "无14天内记录";
        return titleLeftLabel
    }()
    
    lazy var subTitleLeftLabel:UILabel = {[weak self] in
        var subTitleLeftLabel = UILabel()
        subTitleLeftLabel.font = YLZFont.medium(size: 16)
        subTitleLeftLabel.textColor = YLZColorTitleOne
        subTitleLeftLabel.text = "核酸检测";
        return subTitleLeftLabel
    }()
    
    lazy var leftSeparatorView:UIView = {[weak self] in
        var leftSeparatorView = UIView()
        leftSeparatorView.backgroundColor = YLZColorLine;
        return leftSeparatorView
    }()
    
    
    lazy var rightView:UIView = {[weak self] in
        let rightView = UIView()
        rightView.backgroundColor = YLZColorAllInsertCode;
        rightView.layer.cornerRadius = 12.0;
        rightView.layer.masksToBounds = true;
        return rightView
    }()
    
    lazy var iconRightImageView:UIImageView = {[weak self] in
        var iconRightImageView = UIImageView()
        iconRightImageView.image = UIImage.init(named: "ylz_jiezhong_all");
        return iconRightImageView
    }()
    
    lazy var titleRightLabel:UILabel = {[weak self] in
        var titleRightLabel = UILabel()
        titleRightLabel.font = YLZFont.medium(size: 20)
        titleRightLabel.textColor = YLZColorTitleOne
        titleRightLabel.text = "已全程接种";
        return titleRightLabel
    }()
    
    lazy var subTitleRightLabel:UILabel = {[weak self] in
        var subTitleRightLabel = UILabel()
        subTitleRightLabel.font = YLZFont.medium(size: 16)
        subTitleRightLabel.textColor = YLZColorTitleOne
        subTitleRightLabel.text = "疫苗接种";
        return subTitleRightLabel
    }()
    
    lazy var rightSeparatorView:UIView = {[weak self] in
        var rightSeparatorView = UIView()
        rightSeparatorView.backgroundColor = YLZColorLine;
        return rightSeparatorView
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

