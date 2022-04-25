//
//  YLZRouteCodeTableHeaderView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit

class YLZRouteCodeTableHeaderView: UIView {
    
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
    lazy var picImageView: UIImageView = {[weak self] in
        let picImageView = UIImageView()
        picImageView.image = UIImage.init(named: "ylz_top_pic")
        return picImageView
    }()
    
}
    
//MARK: Public Method
extension YLZRouteCodeTableHeaderView {
    func setUI() {
        self.addSubview(self.picImageView)
        
        self.setMas()
    }
    func setMas() {
        self.picImageView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}
 
