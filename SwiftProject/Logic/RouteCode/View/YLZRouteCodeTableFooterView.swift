//
//  YLZRouteCodeTableFooterView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit

class YLZRouteCodeTableFooterView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    lazy var titleLabel: UILabel = {[weak self] in
        let titleLabel = UILabel()
        titleLabel.font = YLZFont.regular(size: 18)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "信息说明"
        return titleLabel
    }()
    lazy var sourceLeftLabel: UILabel = {[weak self] in
        let sourceLeftLabel = UILabel()
        sourceLeftLabel.font = YLZFont.regular(size: 14)
        sourceLeftLabel.numberOfLines = 0
        sourceLeftLabel.textColor = YLZColorTitleTwo
        sourceLeftLabel.text = "数据来源："
        return sourceLeftLabel
    }()
    lazy var sourceRightLabel: UILabel = {[weak self] in
        let sourceRightLabel = UILabel()
        sourceRightLabel.font = YLZFont.regular(size: 14)
        sourceRightLabel.numberOfLines = 0
        sourceRightLabel.textColor = YLZColorTitleTwo
        sourceRightLabel.textAlignment = .left;
        sourceRightLabel.text = "国家政务服务平台和福建省相关部门";
        return sourceRightLabel
    }()
    lazy var mindLeftLabel: UILabel = {[weak self] in
        let mindLeftLabel = UILabel()
        mindLeftLabel.font = YLZFont.regular(size: 14)
        mindLeftLabel.numberOfLines = 0
        mindLeftLabel.textColor = YLZColorTitleTwo
        mindLeftLabel.text = "注意事项："
        return mindLeftLabel
    }()
    lazy var mindRightLabel: UILabel = {[weak self] in
        let mindRightLabel = UILabel()
        mindRightLabel.font = YLZFont.regular(size: 14)
        mindRightLabel.numberOfLines = 0
        mindRightLabel.textColor = YLZColorTitleTwo
        mindRightLabel.textAlignment = .left;
        mindRightLabel.text = "使用健康码时不要离开本页面且需本人操作确认";
        return mindRightLabel
    }()
    lazy var rangeLeftLabel: UILabel = {[weak self] in
        let rangeLeftLabel = UILabel()
        rangeLeftLabel.font = YLZFont.regular(size: 14)
        rangeLeftLabel.numberOfLines = 0
        rangeLeftLabel.textColor = YLZColorTitleTwo
        rangeLeftLabel.text = "使用范围："
        return rangeLeftLabel
    }()
    lazy var rangeRightLabel: UILabel = {[weak self] in
        let rangeRightLabel = UILabel()
        rangeRightLabel.font = YLZFont.regular(size: 14)
        rangeRightLabel.numberOfLines = 0
        rangeRightLabel.textColor = YLZColorTitleTwo
        rangeRightLabel.textAlignment = .left;
        rangeRightLabel.text = "依托国家政务服务平台，实现跨省（区、市）数据共享和互通互认";
        return rangeRightLabel
    }()
    
    lazy var telLeftLabel: UILabel = {[weak self] in
        let telLeftLabel = UILabel()
        telLeftLabel.font = YLZFont.regular(size: 14)
        telLeftLabel.numberOfLines = 0
        telLeftLabel.textColor = YLZColorTitleTwo
        telLeftLabel.text = "客服电话："
        return telLeftLabel
    }()
    lazy var telRightLabel: UILabel = {[weak self] in
        let telRightLabel = UILabel()
        telRightLabel.font = YLZFont.regular(size: 14)
        telRightLabel.numberOfLines = 0
        telRightLabel.textColor = YLZColorTitleTwo
        telRightLabel.textAlignment = .left;
        telRightLabel.text = "400-666-1331 （7*24小时）";
        return telRightLabel
    }()
    lazy var mainOrgLeftLabel: UILabel = {[weak self] in
        let mainOrgLeftLabel = UILabel()
        mainOrgLeftLabel.font = YLZFont.regular(size: 14)
        mainOrgLeftLabel.numberOfLines = 0
        mainOrgLeftLabel.textColor = YLZColorTitleTwo
        mainOrgLeftLabel.text = "主办机构："
        return mainOrgLeftLabel
    }()
    lazy var mainOrgRightLabel: UILabel = {[weak self] in
        let mainOrgRightLabel = UILabel()
        mainOrgRightLabel.font = YLZFont.regular(size: 14)
        mainOrgRightLabel.numberOfLines = 0
        mainOrgRightLabel.textColor = YLZColorTitleTwo
        mainOrgRightLabel.textAlignment = .left;
        mainOrgRightLabel.text = "福建省数字办 卫健委 医保局";
        return mainOrgRightLabel
    }()
    lazy var subOrgLeftLabel: UILabel = {[weak self] in
        let subOrgLeftLabel = UILabel()
        subOrgLeftLabel.font = YLZFont.regular(size: 14)
        subOrgLeftLabel.numberOfLines = 0
        subOrgLeftLabel.textColor = YLZColorTitleTwo
        subOrgLeftLabel.text = "承办机构："
        return subOrgLeftLabel
    }()
    lazy var subOrgRightLabel: UILabel = {[weak self] in
        let subOrgRightLabel = UILabel()
        subOrgRightLabel.font = YLZFont.regular(size: 14)
        subOrgRightLabel.numberOfLines = 0
        subOrgRightLabel.textColor = YLZColorTitleTwo
        subOrgRightLabel.textAlignment = .left;
        subOrgRightLabel.text = "福建省大数据有限公司";
        return subOrgRightLabel
    }()
}
    
//MARK: Public Method
extension YLZRouteCodeTableFooterView {
    func setUI() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.sourceLeftLabel)
        self.addSubview(self.sourceRightLabel)
        self.addSubview(self.mindLeftLabel)
        self.addSubview(self.mindRightLabel)
        self.addSubview(self.rangeLeftLabel)
        self.addSubview(self.rangeRightLabel)
        
        self.addSubview(self.telLeftLabel)
        self.addSubview(self.telRightLabel)
        self.addSubview(self.mainOrgLeftLabel)
        self.addSubview(self.mainOrgRightLabel)
        self.addSubview(self.subOrgLeftLabel)
        self.addSubview(self.subOrgRightLabel)
        
        self.setMas()
    }
    func setMas() {
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(24);
            make.centerX.equalTo(self);
        }
        self.sourceLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(24);
        }
        self.sourceRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(96);
            make.right.equalTo(self.snp.right).offset(-24);
        }
        self.mindLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sourceRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(24);
        }
        self.mindRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.sourceRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(96);
            make.right.equalTo(self.snp.right).offset(-24);
        }
        self.rangeLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.mindRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(24);
        }
        self.rangeRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.mindRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(96);
            make.right.equalTo(self.snp.right).offset(-24);
        }
        self.telLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.rangeRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(24);
        }
        self.telRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.rangeRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(96);
            make.right.equalTo(self.snp.right).offset(-24);
        }
        self.mainOrgLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.telRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(24);
        }
        self.mainOrgRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.telRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(96);
            make.right.equalTo(self.snp.right).offset(-24);
        }
        self.subOrgLeftLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainOrgRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(24);
        }
        self.subOrgRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.mainOrgRightLabel.snp.bottom).offset(8);
            make.left.equalTo(self.snp.left).offset(96);
            make.right.equalTo(self.snp.right).offset(-24);
            make.bottom.equalTo(self.snp.bottom).offset(-24);
        }
    }
}
 
//MARK: IB-Action
extension YLZRouteCodeTableFooterView {
    
}
    
//MARK: Notice
extension YLZRouteCodeTableFooterView {
    
}
    
//MARK: Delegate
extension YLZRouteCodeTableFooterView {
    
}
