//
//  HrssAllDoSonTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/12.
//

import UIKit

class HrssAllDoSonTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.starImageView)
        self.contentView.addSubview(self.separatorView)
        self.setMas();
    }
    
    func setMas() {
        self.titleLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(16)
        }
        self.starImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.contentView)
            make.left.equalTo(self.titleLabel.snp.right).offset(12)
        }
        self.separatorView.snp.makeConstraints{ (make) in
            make.bottom.left.right.equalTo(self.contentView)
            make.height.equalTo(0.5);
        }
    }
    
    lazy var starImageView:UIImageView = {
        let starImageView =  UIImageView()
        starImageView.image = UIImage.init(named: "ic_online_do")
        return starImageView
    }()
    
    lazy var separatorView:UIView = {
        let separatorView =  UIView()
        separatorView.backgroundColor = YLZColorBackGround;
        return separatorView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel =  UILabel()
        titleLabel.font = YLZFont.medium(size: 14.0);
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "失业登记审核结果查询";
        return titleLabel
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

extension HrssAllDoSonTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}
