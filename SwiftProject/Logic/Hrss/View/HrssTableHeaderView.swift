//
//  HrssTableHeaderView.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import Foundation

class HrssTableHeaderView: UIView {
    
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
//        let layout = HiDotLayout(dotColor: UIColor.darkGray, dotSelectColor: UIColor.white, dotType: .default)
//        /*设置dot的间距*/
//        layout.dotMargin = 8
//        /* 如果需要改变dot的大小，设置dotWidth的宽度即可 */
//        layout.dotWidth = 8
//        /*如需和系统一致，dot放大效果需手动关闭 */
//        layout.isScale = false
//        carouselView.dotLayout = layout;
        return carouselView
    }()
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
        self.setMas()
    }
    func setMas() {
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
