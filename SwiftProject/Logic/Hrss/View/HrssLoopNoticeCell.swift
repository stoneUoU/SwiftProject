//
//  HrssLoopNoticeCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/13.
//

class HrssLoopNoticeCell:HiLoopViewItem {
    
    public var model = [HrssModel]() {
        didSet {
            if (model.count > 1) {
                self.titleLabel.text = model[0].title;
                self.iconImageView.image = UIImage(named: model[0].iconUrl)
                self.arrowImageView.image = UIImage(named: "icon_hrss_home_arrow")
                
                self.bottomTitleLabel.text = model[1].title;
                self.bottomIconImageView.image = UIImage(named: model[1].iconUrl)
                self.bottomArrowImageView.image = UIImage(named: "icon_hrss_home_arrow")
            } else if (model.count > 0) {
                self.titleLabel.text = model[0].title;
                self.iconImageView.image = UIImage(named: model[0].iconUrl)
                self.arrowImageView.image = UIImage(named: "icon_hrss_home_arrow")
            }
        }
    }
    required init(reuseIdentifier: String) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(self.topView);
        self.topView.addSubview(self.iconImageView);
        self.topView.addSubview(self.arrowImageView);
        self.topView.addSubview(self.titleLabel);
        
        self.addSubview(self.bottomView);
        self.bottomView.addSubview(self.bottomIconImageView);
        self.bottomView.addSubview(self.bottomArrowImageView);
        self.bottomView.addSubview(self.bottomTitleLabel);
        
        self.setMas();
    }
    
    func setMas() {
//        self.topView.backgroundColor = .red;
//        self.bottomView.backgroundColor = .green;
        self.topView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(24)
        }
        self.iconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.topView.snp.left)
            make.centerY.equalTo(self.topView)
            make.size.equalTo(CGSize(width: 28, height: 17))
        }
        self.arrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.topView.right).offset(-12)
            make.centerY.equalTo(self.topView)
            make.size.equalTo(CGSize(width: 14, height: 15))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.topView)
            make.left.equalTo(self.iconImageView.snp.right).offset(8);
            make.right.equalTo(self.arrowImageView.snp.left).offset(-8);
        }
        
        self.bottomView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self)
            make.height.equalTo(24)
        }
        self.bottomIconImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.bottomView.snp.left)
            make.centerY.equalTo(self.bottomView)
            make.size.equalTo(CGSize(width: 28, height: 17))
        }
        self.bottomArrowImageView.snp.makeConstraints { (make) in
            make.right.equalTo(self.bottomView.right).offset(-12)
            make.centerY.equalTo(self.bottomView)
            make.size.equalTo(CGSize(width: 14, height: 15))
        }
        self.bottomTitleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.bottomView)
            make.left.equalTo(self.bottomIconImageView.snp.right).offset(8);
            make.right.equalTo(self.bottomArrowImageView.snp.left).offset(-8);
        }
    }
    
    fileprivate lazy var topView: UIView = {
        let topView = UIView()
        return topView
    }()
    
    fileprivate lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = YLZFont.regular(size: 12);
        titleLabel.textAlignment = .left
        titleLabel.textColor = YLZColorTitleOne;
        titleLabel.numberOfLines = 0;
        return titleLabel
    }()
    
    fileprivate lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        return iconImageView
    }()
    fileprivate lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        return arrowImageView
    }()
    
    fileprivate lazy var bottomView: UIView = {
        let bottomView = UIView()
        return bottomView
    }()
    
    fileprivate lazy var bottomTitleLabel: UILabel = {
        let bottomTitleLabel = UILabel()
        bottomTitleLabel.font = YLZFont.regular(size: 12);
        bottomTitleLabel.textAlignment = .left
        bottomTitleLabel.textColor = YLZColorTitleOne;
        bottomTitleLabel.numberOfLines = 0;
        return bottomTitleLabel
    }()
    
    fileprivate lazy var bottomIconImageView: UIImageView = {
        let bottomIconImageView = UIImageView()
        return bottomIconImageView
    }()
    fileprivate lazy var bottomArrowImageView: UIImageView = {
        let bottomArrowImageView = UIImageView()
        return bottomArrowImageView
    }()
}
