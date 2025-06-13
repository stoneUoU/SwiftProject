//
//  HrssTopicLeftView.swift
//  SwiftProject
//
//  Created by stone on 2025/6/13.
//

import Foundation
import SwiftyJSON

class HrssTopicLeftView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var bgImageView:UIImageView = {
        let bgImageView =  UIImageView()
        bgImageView.image = UIImage(named: "ic_topic_left")
        return bgImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel =  UILabel()
        titleLabel.font = YLZFont.medium(size: 16);
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "就业创业";
        return titleLabel
    }()
    
    lazy var underTitleLabel:UILabel = {
        let underTitleLabel =  UILabel()
        underTitleLabel.font = YLZFont.regular(size: 12.0);
        underTitleLabel.textColor = YLZColorTitleThree
        underTitleLabel.text = "国家平台 一站就业";
        return underTitleLabel
    }()
    
    fileprivate lazy var seeLabel: UIButton = {
        let seeLabel = UIButton()
        seeLabel.titleLabel?.font = YLZFont.medium(size:11)
        seeLabel.setTitleColor(YLZColorMZTBlueView, for: .normal)
        seeLabel.setImageAndTitle(imageName:"ic_easy_go", title: "去看看 ", type: .PositionRight, Space: 16)
        seeLabel.layer.cornerRadius = 10;
        seeLabel.layer.masksToBounds = true;
        seeLabel.layer.borderWidth = 0.5;
        seeLabel.layer.borderColor = YLZColorMZTBlueView.cgColor;
        return seeLabel
    }()
}

//MARK: Public Method
extension HrssTopicLeftView {
    func setUI() {
        self.addSubview(self.bgImageView);
        self.addSubview(self.titleLabel)
        self.addSubview(self.underTitleLabel)
        self.addSubview(self.seeLabel)
        self.setMas()
    }
    func setMas() {
        self.bgImageView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self);
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.snp.top).offset(12);
            make.left.equalTo(self.snp.left).offset(16);
        }
        self.underTitleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10);
            make.left.equalTo(self.snp.left).offset(16);
        }
        self.seeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.underTitleLabel.snp.bottom).offset(12);
            make.left.equalTo(self.snp.left).offset(16);
            make.size.equalTo(CGSize(width: 64, height: 20))
        }
    }
}
 
//MARK: IB-Action
extension HrssTopicLeftView {
    
}
    
//MARK: Notice
extension HrssTopicLeftView {
    
}
    
//MARK: Delegate
extension HrssTopicLeftView {
    
}


