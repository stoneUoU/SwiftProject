//
//  HrssTopicRightView.swift
//  SwiftProject
//
//  Created by stone on 2025/6/13.
//

import Foundation
import SwiftyJSON

class HrssTopicRightView: UIView {
    public var model: HrssModel? {
        didSet {
            guard let functionName = model?.title else { return }
            self.titleLabel.text = model?.title ?? "";
            self.underTitleLabel.text = model?.iconUrl ?? "";
            self.bgImageView.image = UIImage(named: model?.bgUrl ?? "")
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var bgImageView:UIImageView = {
        let bgImageView =  UIImageView();
        return bgImageView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel =  UILabel()
        titleLabel.font = YLZFont.medium(size: 16);
        titleLabel.textColor = YLZColorTitleOne;
        return titleLabel
    }()
    
    lazy var underTitleLabel:UILabel = {
        let underTitleLabel =  UILabel()
        underTitleLabel.font = YLZFont.regular(size: 12.0);
        underTitleLabel.textColor = YLZColorTitleThree;
        return underTitleLabel
    }()
}

//MARK: Public Method
extension HrssTopicRightView {
    func setUI() {
        self.addSubview(self.bgImageView);
        self.addSubview(self.titleLabel)
        self.addSubview(self.underTitleLabel)
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
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(16);
        }
    }
}
 
//MARK: IB-Action
extension HrssTopicRightView {
    
}
    
//MARK: Notice
extension HrssTopicRightView {
    
}
    
//MARK: Delegate
extension HrssTopicRightView {
    
}


