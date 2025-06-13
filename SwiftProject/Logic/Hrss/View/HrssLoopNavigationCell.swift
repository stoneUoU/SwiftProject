//
//  HrssLoopNavigationCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/13.
//

import Foundation

class HrssLoopNavigationCell:HiMarqueeViewCell {
    
    public var model: HrssModel? {
        didSet {
            guard let functionName = model?.title else { return }
            self.titleLabel.text = functionName;
            self.searchImageView.image = UIImage(named: model?.iconUrl ?? "")
        }
    }
    
    required init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier);
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.addSubview(self.searchImageView);
        self.addSubview(self.titleLabel);
        
        self.setMas();
    }
    
    override func setMas() {
        self.searchImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(12)
            make.centerY.equalTo(self)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self.searchImageView.snp.right).offset(8);
        }
    }
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = YLZFont.regular(size: 12);
        titleLabel.textAlignment = .center
        titleLabel.textColor = YLZColorTitleOne;
        titleLabel.numberOfLines = 0;
        return titleLabel
    }()
    
    fileprivate lazy var searchImageView: UIImageView = {
        let searchImageView = UIImageView()
        return searchImageView
    }()
}
