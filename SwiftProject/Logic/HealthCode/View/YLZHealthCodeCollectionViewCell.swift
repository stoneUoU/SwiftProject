//
//  YLZHealthCodeCollectionViewCell.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

class YLZHealthCodeCollectionViewCell: UICollectionViewCell {
    
    
    var titleString: String? {
        didSet {
            self.titleLabel.text = titleString ?? "";
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.backgroundColor = YLZColorWhite;
        self.setUI();
    }
    
    func setUI() {
        self.contentView.addSubview(self.starImageView)
        self.contentView.addSubview(self.titleLabel)
        
        self.setMas()
    }
    
    func setMas() {
        self.starImageView.snp.makeConstraints{ (make) in
            make.left.equalTo(self.contentView.snp.left).offset(16);
            make.centerY.equalTo(self.contentView);
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.left.equalTo(self.starImageView.snp.right).offset(4);
            make.centerY.equalTo(self.contentView);
        }
    }
    
    lazy var starImageView:UIImageView = {
        let starImageView =  UIImageView()
        starImageView.image = UIImage.init(named: "ylz_mzt_star")
        return starImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel =  UILabel()
        titleLabel.font = YLZFont.regular(size: 16.0);
        titleLabel.textColor = YLZColorTitleOne
        return titleLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

