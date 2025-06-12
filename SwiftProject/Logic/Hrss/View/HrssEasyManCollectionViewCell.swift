//
//  HrssEasyManCollectionViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/12.
//

import UIKit

class HrssEasyManCollectionViewCell: UICollectionViewCell {
    
    public var model: HrssModel? {
        didSet {
            guard let functionName = model?.title else { return }
            self.titleLabel.text = model?.title ?? "";
            self.starImageView.image = UIImage(named: model?.iconUrl ?? "")
            self.wrapImageView.image = UIImage(named: model?.bgUrl ?? "")
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUI();
    }
    
    func setUI() {
        self.contentView.addSubview(self.wrapImageView)
        self.contentView.addSubview(self.starImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.smallLabel)
        self.contentView.addSubview(self.seeLabel)
        
        self.setMas()
    }
    
    func setMas() {
        self.wrapImageView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self.contentView);
        }
        self.starImageView.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.contentView.snp.top).offset(12);
            make.size.equalTo(CGSize(width: 44, height: 44))
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.starImageView.snp.bottom).offset(5);
        }
        self.smallLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.titleLabel.snp.bottom).offset(5);
        }
        self.seeLabel.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.smallLabel.snp.bottom).offset(5);
        }
    }
    
    lazy var starImageView:UIImageView = {
        let starImageView =  UIImageView()
        return starImageView
    }()
    
    lazy var wrapImageView:UIImageView = {
        let wrapImageView =  UIImageView()
        return wrapImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel =  UILabel()
        titleLabel.font = YLZFont.medium(size: 14.0);
        titleLabel.textColor = YLZColorTitleOne
        return titleLabel
    }()
    
    lazy var smallLabel:UILabel = {
        let smallLabel =  UILabel()
        smallLabel.font = YLZFont.regular(size: 10);
        smallLabel.textColor = YLZColorTitleFour
        smallLabel.text = "记录一生 保障一生";
        return smallLabel
    }()
    
    fileprivate lazy var seeLabel: UIButton = {
        let seeLabel = UIButton()
        seeLabel.titleLabel?.font = YLZFont.medium(size:11)
        seeLabel.setTitleColor(YLZColorMZTBlueView, for: .normal)
        seeLabel.setImageAndTitle(imageName:"ic_topic_go", title: "去看看", type: .PositionRight, Space: 6)
        return seeLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}



