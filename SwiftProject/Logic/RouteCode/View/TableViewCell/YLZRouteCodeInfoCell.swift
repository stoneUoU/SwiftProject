//
//  YLZRouteCodeInfoCell.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit

class YLZRouteCodeInfoCell: UITableViewCell {
    
    public var funcModel: YLZFunctionModel? {
        didSet {
            guard let functionName = funcModel?.functionName else { return }
            self.iconImageView.image = UIImage.init(named: funcModel!.iconName);
            self.titleLabel.text = funcModel!.functionName;
            if (funcModel!.topFillet) {
                let corners:UIRectCorner = [.topLeft,.topRight];
                self.bgView.corner(byRoundingCorners: corners, radii: 12);
            } else  if (funcModel!.bottomFillet) {
                let corners: UIRectCorner = [.bottomLeft,.bottomRight];
                self.bgView.corner(byRoundingCorners: corners, radii: 12);
            } else {
                let corners: UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight];
                self.bgView.corner(byRoundingCorners: corners, radii: 0);
            }
            self.separatorView.isHidden = funcModel!.bottomFillet;
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorRouteCode;
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.iconImageView);
        self.bgView.addSubview(self.titleLabel);
        self.bgView.addSubview(self.separatorView);
        
        self.setMas();
    }
    
    func setMas() {
        self.iconImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.left.equalTo(self.bgView).offset(16);
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.bgView);
            make.left.equalTo(self.iconImageView.snp.right).offset(16);
        }
        self.separatorView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView);
            make.height.equalTo(0.5);
            make.left.equalTo(self.iconImageView.snp.left)
            make.right.equalTo(self.bgView.snp.right).offset(-16)
        }
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 24, y: 0, width: HiSCREENWIDTH - 48, height: 64)
        bgView.backgroundColor = YLZColorWhite;
//        bgView.layer.masksToBounds = true;
//        bgView.layer.cornerRadius = 10.0;
//        bgView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
//        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
//        bgView.layer.shadowOpacity = 1;
//        bgView.layer.shadowRadius = 12;
        return bgView
    }()
    
    lazy var iconImageView:UIImageView = {[weak self] in
        var iconImageView = UIImageView()
        return iconImageView
    }()
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size: 22)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "";
        return titleLabel
    }()
    
    lazy var separatorView:UIView = {[weak self] in
        var separatorView = UIView()
        separatorView.backgroundColor = YLZColorLine;
        return separatorView
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

extension YLZRouteCodeInfoCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}

extension UIView {
    
    /// 部分圆角
    ///
    /// - Parameters:
    ///   - corners: 需要实现为圆角的角，可传入多个
    ///   - radii: 圆角半径
    func corner(byRoundingCorners corners: UIRectCorner, radii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radii, height: radii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

