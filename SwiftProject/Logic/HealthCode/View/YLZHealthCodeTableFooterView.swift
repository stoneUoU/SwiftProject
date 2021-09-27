//
//  YLZHealthCodeTableFooterView.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit


class YLZHealthCodeTableFooterView: UIView {
    
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
    lazy var telLabel: UILabel = {[weak self] in
        let telLabel = UILabel()
        telLabel.font = YLZFont.regular(size: 12)
        telLabel.textAlignment = .center
        telLabel.numberOfLines = 0
        telLabel.textColor = YLZColorWhite
        telLabel.text = "客服电话：12320 0591-62623959 8:00-12:00 14:00-18:00"
        return telLabel
    }()
    lazy var copyRightLabel: UILabel = {[weak self] in
        let copyRightLabel = UILabel()
        copyRightLabel.font = YLZFont.regular(size:12)
        copyRightLabel.textAlignment = .center
        copyRightLabel.numberOfLines = 0
        copyRightLabel.textColor = YLZColorWhite
        copyRightLabel.text = "本应用由福建省数字办 卫健委 医保局主办 福建省经济信息中心承办"
        return copyRightLabel
    }()
}
    
//MARK: Public Method
extension YLZHealthCodeTableFooterView {
    func setUI() {
        self.addSubview(self.telLabel)
        self.addSubview(self.copyRightLabel)
        
        self.setMas()
    }
    func setMas() {
        self.telLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(16);
            make.centerX.equalTo(self);
        }
        self.copyRightLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.telLabel.snp.bottom).offset(8);
            make.centerX.equalTo(self);
        }
    }
}
 
//MARK: IB-Action
extension YLZHealthCodeTableFooterView {
    
}
    
//MARK: Notice
extension YLZHealthCodeTableFooterView {
    
}
    
//MARK: Delegate
extension YLZHealthCodeTableFooterView {
    
}
