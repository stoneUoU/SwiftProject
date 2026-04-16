//
//  HiMeiTuanSlideCell.swift
//  SwiftProject
//
//  Created by stone on 2026/3/31.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2


import UIKit

class HiMeiTuanSlideCell: UICollectionViewCell {
    lazy var itemButton: UIButton = {
        let itemBtn = UIButton()
        itemBtn.backgroundColor = UIColor.white
        itemBtn.isUserInteractionEnabled = false
        itemBtn.layer.cornerRadius = 10
        itemBtn.layer.masksToBounds = true
        itemBtn.layer.borderColor = UIColor.lightGray.cgColor
        itemBtn.layer.borderWidth = 0.5
        return itemBtn
    }()
    
    lazy var itemLabel: UILabel = {
        let itemL = UILabel()
        itemL.textColor = UIColor.gray
        itemL.font = UIFont.systemFont(ofSize: 11.0)
        itemL.textAlignment = .center
        return itemL
    }()
    
    var type: HiMeiTuanSlideType?
    
    // MARK:- 记录属性
    var model: (name: String, icon: UIImage, type: HiMeiTuanSlideType)? {
        didSet {
            self.itemButton.setImage(model?.icon, for: .normal)
            self.itemLabel.text = model?.name
            self.type = model?.type
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(itemButton)
        self.addSubview(itemLabel)
        
        itemLabel.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.snp.bottom).offset(-2)
            make.height.equalTo(21)
        }
        itemButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(6)
            make.bottom.equalTo(itemLabel.snp.top).offset(-5)
            make.width.equalTo(itemButton.snp.height)
            make.centerX.equalTo(self.snp.centerX)
        }
        
    }
}
