//
//  HrssTableHeaderView.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import Foundation
import SwiftyJSON

class HrssTableHeaderView: UIView {
    var menuModels:[HrssModel] = [HrssModel.init(json:JSON(["iconUrl":"ic_home_scaning","title":"扫一扫","tag":"0"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_sdking","title":"电子社保卡","tag":"0"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_teling","title":"12333","tag":"0"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_msg_center","title":"消息中心","tag":"0"]))];
    var funcModels:[HrssModel] = [HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"扫一扫","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"电子社保卡","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"12333","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"消息中心","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"扫一扫","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"电子社保卡","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_rs_origation","title":"12333","tag":"1"])),HrssModel.init(json:JSON(["iconUrl":"ic_home_more_service","title":"更多服务","tag":"1"]))];
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate lazy var carouselView: HiCarouselView = {
        let carouselView = HiCarouselView.init(frame:CGRectMake(0, 0, HiSCREENWIDTH, HiStatusBarH + 300));
        carouselView.hi_timeInterval = 5.0;
        carouselView.isAutoScroll = true;
        carouselView.dotDirection = .right
        carouselView.hiPageControlHeight = 25
        carouselView.adjustValue = 16.0;
        return carouselView
    }()
    private lazy var menuCollectionView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(HrssFuncCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HrssFuncCollectionViewCell.self))
        menuCollectionView.showsVerticalScrollIndicator=false
        menuCollectionView.showsHorizontalScrollIndicator=false;
        menuCollectionView.isScrollEnabled = false;
        menuCollectionView.tag = 0;
        menuCollectionView.backgroundColor = .clear;
        return menuCollectionView
    }()
    private lazy var funcCollectionView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let funcCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        funcCollectionView.delegate = self
        funcCollectionView.dataSource = self
        funcCollectionView.register(HrssFuncCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HrssFuncCollectionViewCell.self))
        funcCollectionView.showsVerticalScrollIndicator=false
        funcCollectionView.showsHorizontalScrollIndicator=false;
        funcCollectionView.isScrollEnabled = false;
        funcCollectionView.tag = 1;
        return funcCollectionView
    }()
    
    fileprivate lazy var menuView: UIView = {
        let menuView = UIView.init();
        return menuView
    }()
    fileprivate lazy var funcView: UIView = {
        let funcView = UIView.init();
        funcView.backgroundColor = UIColor.white;
        funcView.layer.masksToBounds = true;
        funcView.layer.cornerRadius = 10.0;
        funcView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
        funcView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        funcView.layer.shadowOpacity = 1;
        funcView.layer.shadowRadius = 10;
        return funcView
    }()
}

extension HrssTableHeaderView:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView.tag == 0 ? self.menuModels.count : self.funcModels.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HrssFuncCollectionViewCell.self), for: indexPath) as! HrssFuncCollectionViewCell;
        viewCell.model = collectionView.tag == 0 ? self.menuModels[indexPath.row] : self.funcModels[indexPath.row];
        return viewCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (HiSCREENWIDTH - 42)/4, height: 82);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
    
//MARK: Public Method
extension HrssTableHeaderView {
    func setUI() {
        self.addSubview(self.carouselView);
        var autoModels:[HiAutoModel] = [HiAutoModel]();
        let autoImages:[String] = ["ic_home_carousel_bg_0000","ic_home_carousel_bg_0001","ic_home_carousel_bg_0002"];
        for i in 0..<autoImages.count {
            let autoModel = HiAutoModel();
            autoModel.image = autoImages[i];
            autoModels.append(autoModel);
        }
        DispatchQueue.main.async{
            self.carouselView.autoModels = autoModels;
            self.carouselView.autoDidSelectItemHandle = {(index) in
            }
        }
        self.addSubview(self.menuView);
        self.menuView.addSubview(self.menuCollectionView);
        self.addSubview(self.funcView);
        self.funcView.addSubview(self.funcCollectionView);
        
        self.setMas()
    }
    func setMas() {
        self.menuView.snp.makeConstraints{ (make) in
            make.top.equalTo(self).offset(HiStatusBarAndNavigationBarH+4)
            make.left.equalTo(self.snp.left).offset(16)
            make.size.equalTo(CGSize(width: HiSCREENWIDTH - 32, height: 82))
        }
        self.menuCollectionView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self.menuView);
        }
        self.funcView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(self.snp.left).offset(16)
            make.size.equalTo(CGSize(width: HiSCREENWIDTH - 32, height: 164))
        }
        self.funcCollectionView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self.funcView);
        }
    }
}
 
//MARK: IB-Action
extension HrssTableHeaderView {
    
}
    
//MARK: Notice
extension HrssTableHeaderView {
    
}
    
//MARK: Delegate
extension HrssTableHeaderView {
    
}
