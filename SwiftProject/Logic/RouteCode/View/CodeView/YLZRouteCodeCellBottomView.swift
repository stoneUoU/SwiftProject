//
//  YLZRouteCodeCellBottomView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/25.
//

import UIKit

class YLZRouteCodeCellBottomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(self.leftIconImageView);
        self.addSubview(self.rightIconImageView);
        self.addSubview(self.dashImageView);
        self.addSubview(self.searchLabel);
        self.addSubview(self.arrowIconImageView);
        self.addSubview(self.infoLabel);
        self.addSubview(self.processImageView);
        
        self.setMas();
    }
    
    func setMas() {
        self.leftIconImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.snp.top).offset(8);
            make.left.equalTo(self.snp.left).offset(-4);
        }
        self.rightIconImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.leftIconImageView.snp.top);
            make.right.equalTo(self.snp.right).offset(4);
        }
        self.searchLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.leftIconImageView.snp.bottom).offset(6);
            make.left.equalTo(self.snp.left).offset(16);
        }
        self.arrowIconImageView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.searchLabel);
            make.left.equalTo(self.searchLabel.snp.right).offset(6);
        }
        self.infoLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.searchLabel.snp.bottom).offset(6);
            make.left.equalTo(self.snp.left).offset(16);
        }
        self.processImageView.snp.makeConstraints{ (make) in
            make.bottom.right.equalTo(self);
        }
        YLZView.drawLine(imageView: self.dashImageView, withDashColor: YLZColorTitleThree);
    }
    lazy var leftIconImageView:UIImageView = {[weak self] in
        var familyIconImageView = UIImageView()
        familyIconImageView.image = UIImage.init(named: "ylz_left_jiantou")
        return familyIconImageView
    }()
    lazy var rightIconImageView:UIImageView = {[weak self] in
        var rightIconImageView = UIImageView()
        rightIconImageView.image = UIImage.init(named: "ylz_right_jiantou")
        return rightIconImageView
    }()
    
    lazy var dashImageView:UIImageView = {[weak self] in
        var dashImageView = UIImageView()
        dashImageView.frame = CGRect.init(x: 16, y: 16, width: SCREENWIDTH - (48+32), height: 2)
        return dashImageView
    }()
    lazy var searchLabel:UILabel = {[weak self] in
        var searchLabel = UILabel()
        searchLabel.font = YLZFont.bold(size: 18);
        searchLabel.textColor = YLZColorTitleOne
        searchLabel.text = "点击查询行程卡";
        return searchLabel
    }()
    lazy var infoLabel:UILabel = {[weak self] in
        var infoLabel = UILabel()
        infoLabel.font = YLZFont.regular(size: 14.0);
        infoLabel.textColor = YLZColorTitleThree
        infoLabel.text = "查询14天内是否到访过中高风险地区";
        return infoLabel
    }()
    
    lazy var arrowIconImageView:UIImageView = {[weak self] in
        var arrowIconImageView = UIImageView()
        arrowIconImageView.image = UIImage.init(named: "ylz_route_to_search")
        return arrowIconImageView
    }()
    
    lazy var processImageView:UIImageView = {[weak self] in
        var processImageView = UIImageView()
        processImageView.image = UIImage.init(named: "ylz_process")
        return processImageView
    }()
}

extension YLZRouteCodeCellBottomView {
    @objc func toOperate(sender: UIButton) {
        
    }
}
