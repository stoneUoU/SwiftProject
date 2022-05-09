//
//  HiOccupationView.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit
import SnapKit

/** 占位图的类型 */
@objc enum HiOccupationViewType : Int {
    /** 没网 */
    case noNetwork = 1
    /** 网络请求加载失败 */
    case noRequestSuccess
    //搜索视频无结果：
    case noSearchData
}

@objc protocol HiOccupationViewDelegate: class {
    func excute(occupationView : HiOccupationView,sender:UIButton)
}

class HiOccupationView: UIView {
    
    @objc weak var delegate : HiOccupationViewDelegate?
    @objc var type: HiOccupationViewType
    
    var outerView:UIView = UIView()
    var imageView:UIImageView = UIImageView()
    var titleLabel:UILabel = UILabel()
    var reloadButton:UIButton!
    
    @objc init(frame: CGRect, type: HiOccupationViewType,delegate:HiOccupationViewDelegate?) {
        self.type = type
        self.delegate = delegate
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setUI()
    }
    
    @objc init(frame: CGRect, type: HiOccupationViewType,delegate:HiOccupationViewDelegate?,bgColor:UIColor) {
        self.type = type
        self.delegate = delegate
        super.init(frame: frame)
        self.backgroundColor = bgColor
        self.setUI()
    }
    
    func setUI(){
        self.addSubview(self.outerView);
        
        self.outerView.addSubview(self.imageView);
        
        self.titleLabel.textColor = .white;
        self.titleLabel.font = UIFont.systemFont(ofSize: 14);
        self.titleLabel.textAlignment = .center
        self.outerView.addSubview(self.titleLabel)
        
        self.reloadButton = UIButton.init();
        self.reloadButton.setTitleColor(.red, for: .normal)
        self.reloadButton.backgroundColor = UIColor.white;
        self.reloadButton.layer.cornerRadius = 3.0;
        self.reloadButton.layer.masksToBounds = true
        self.reloadButton.isHidden = true;
        self.reloadButton.titleLabel?.font = UIFont.systemFont(ofSize: 17);
        self.outerView.addSubview(self.reloadButton)
        self.reloadButton.addTarget(self, action: #selector(self.reloadButtonClicked(sender:)), for: .touchUpInside)
        
        self.setMas();
        
        switch type {
        case .noNetwork:
            //没网:
            self.imageView.image = UIImage(named: "mguo_empty")
            self.titleLabel.text = "无网，请检查网络状态"
            self.reloadButton.setTitle("点击重试", for: .normal)
            break
        case .noRequestSuccess:
            //请求失败:
            self.imageView.image = UIImage(named: "mguo_empty")
            self.titleLabel.text = "很抱歉，内容加载失败";
            self.reloadButton.setTitle("点击重试", for: .normal)
            break
        default:
            //请求失败:
            self.imageView.image = UIImage(named: "mguo_empty")
            self.titleLabel.text = "很抱歉，暂无内容";
            self.reloadButton.isHidden = true
            break
        }
    }
    
    func setMas() {
        self.outerView.snp.makeConstraints { (make) in
            make.center.equalTo(self)
            make.width.equalTo(self.snp.width)
        }
        self.imageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.outerView.snp.top).offset(0)
            make.centerX.equalTo(self)
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.imageView.snp.bottom).offset(24)
            make.centerX.equalTo(self)
        }
        self.reloadButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(36)
            make.centerX.equalTo(self)
            make.width.equalTo(200)
            make.height.equalTo(40)
            make.bottom.equalTo(self.outerView.snp.bottom).offset(-20)
        }
    }
    // MARK: - 重新加载按钮点击
    /** 重新加载按钮点击 */
    @objc func reloadButtonClicked(sender: UIButton) {
        self.delegate?.excute(occupationView:self, sender: sender);
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

