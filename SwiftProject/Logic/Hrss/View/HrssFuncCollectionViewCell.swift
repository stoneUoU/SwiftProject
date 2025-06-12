//
//  HrssFuncCollectionViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import UIKit

class HrssFuncCollectionViewCell: UICollectionViewCell {
    
    public var model: HrssModel? {
        didSet {
            guard let functionName = model?.title else { return }
            self.titleLabel.text = model?.title ?? "";
            self.starImageView.image = UIImage(named: model?.iconUrl ?? "")
            self.starImageView.snp.updateConstraints{ (make) in
                if (model?.tag ?? "" == "0") {
                    make.size.equalTo(CGSize(width: 44, height: 44))
                } else {
                    make.size.equalTo(CGSize(width: 36, height: 36))
                }
            }
            if (model?.tag ?? "" == "0") {
                self.titleLabel.font = YLZFont.bold(size: 14.0);
                self.titleLabel.textColor = YLZColorWhite
            } else {
                self.titleLabel.font = YLZFont.regular(size: 12.0);
                self.titleLabel.textColor = YLZColorTitleOne
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI();
    }
    
    func setUI() {
        self.contentView.addSubview(self.starImageView)
        self.contentView.addSubview(self.titleLabel)
        
        self.setMas()
    }
    
    func setMas() {
        self.starImageView.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView.snp.top).offset(12);
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.starImageView.snp.bottom).offset(6);
        }
    }
    
    lazy var starImageView:UIImageView = {
        let starImageView =  UIImageView()
        return starImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel =  UILabel()
        titleLabel.font = YLZFont.medium(size: 14.0);
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


