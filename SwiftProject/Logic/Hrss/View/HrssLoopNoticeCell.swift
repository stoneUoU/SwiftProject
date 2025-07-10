//
//  HrssLoopNoticeCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/13.
//

class HrssLoopNoticeItemView:UIView {
    
    public var model:HrssModel? {
        didSet {
            guard let functionName = model?.title else { return }
            self.titleLabel.text = functionName;
            self.iconImageView.image = UIImage(named: model?.iconUrl ?? "")
            self.arrowImageView.image = UIImage(named: "icon_hrss_home_arrow")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
}
