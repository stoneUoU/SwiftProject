//
//  HiMeiTuanSlideView.swift
//  SwiftProject
//
//  Created by stone on 2026/3/31.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

import UIKit

enum HiMeiTuanSlideType: Int {
    case pic        // 照片
    case camera     // 相机
    case sight      // 小视频
    case video      // 视频聊天
    case wallet     // 红包
    case pay        // 转账
    case location   // 位置
    case myfav      // 收藏
    case friendCard // 个人名片
    case voiceInput // 语音输入
    case coupons    // 卡券
}

fileprivate let kMoreCellNumberOfOneRow = 5
fileprivate let kMoreCellRow = 2
fileprivate let kMoreCellNumberOfOnePage = kMoreCellRow * kMoreCellNumberOfOneRow

protocol HiMeiTuanSlideViewDelegate : NSObjectProtocol {
    func chatMoreView(moreView: HiMeiTuanSlideView, didSeletedType type: HiMeiTuanSlideType)
}

class HiMeiTuanSlideView: UIView {
    // MARK:- 代理
    weak var delegate: HiMeiTuanSlideViewDelegate?
    
    // MARK:- 懒加载
    lazy var moreView: UICollectionView = { [unowned self] in
        let collectionV = UICollectionView(frame: CGRect.zero, collectionViewLayout: HiMeiTuanHorizontalLayout(column: kMoreCellNumberOfOneRow, row: kMoreCellRow))
        collectionV.dataSource = self
        collectionV.delegate = self
        return collectionV
    }()

    lazy var pageControl: UIPageControl = { [unowned self] in
        let pageC = UIPageControl()
        pageC.numberOfPages = self.moreDataSouce.count / kMoreCellNumberOfOnePage + (self.moreDataSouce.count % kMoreCellNumberOfOnePage == 0 ? 0 : 1)
        pageC.currentPage = 0
        pageC.pageIndicatorTintColor = UIColor.lightGray
        pageC.currentPageIndicatorTintColor = UIColor.gray
        return pageC
    }()
    
    lazy var moreDataSouce: [(name: String, icon: UIImage, type: HiMeiTuanSlideType)] = {
        return [
            ("照片", #imageLiteral(resourceName: "sharemore_pic"), HiMeiTuanSlideType.pic),
            ("相机", #imageLiteral(resourceName: "sharemore_video"), HiMeiTuanSlideType.camera),
            ("小视频", #imageLiteral(resourceName: "sharemore_sight"), HiMeiTuanSlideType.sight),
            ("视频聊天", #imageLiteral(resourceName: "sharemore_videovoip"), HiMeiTuanSlideType.video),
            ("红包", #imageLiteral(resourceName: "sharemore_wallet"), HiMeiTuanSlideType.wallet),
            ("转账", #imageLiteral(resourceName: "sharemorePay"), HiMeiTuanSlideType.pay),
            ("位置", #imageLiteral(resourceName: "sharemore_location"), HiMeiTuanSlideType.location),
            ("收藏", #imageLiteral(resourceName: "sharemore_myfav"), HiMeiTuanSlideType.myfav),
            ("个人名片", #imageLiteral(resourceName: "sharemore_friendcard"), HiMeiTuanSlideType.friendCard),
            ("语音输入", #imageLiteral(resourceName: "sharemore_voiceinput"), HiMeiTuanSlideType.voiceInput),
            ("卡券", #imageLiteral(resourceName: "sharemore_wallet"), HiMeiTuanSlideType.coupons),
            ("照片", #imageLiteral(resourceName: "sharemore_pic"), HiMeiTuanSlideType.pic),
            ("相机", #imageLiteral(resourceName: "sharemore_video"), HiMeiTuanSlideType.camera),
            ("小视频", #imageLiteral(resourceName: "sharemore_sight"), HiMeiTuanSlideType.sight),
            ("视频聊天", #imageLiteral(resourceName: "sharemore_videovoip"), HiMeiTuanSlideType.video),
            ("红包", #imageLiteral(resourceName: "sharemore_wallet"), HiMeiTuanSlideType.wallet),
            ("转账", #imageLiteral(resourceName: "sharemorePay"), HiMeiTuanSlideType.pay),
            ("位置", #imageLiteral(resourceName: "sharemore_location"), HiMeiTuanSlideType.location),
            ("收藏", #imageLiteral(resourceName: "sharemore_myfav"), HiMeiTuanSlideType.myfav),
            ("个人名片", #imageLiteral(resourceName: "sharemore_friendcard"), HiMeiTuanSlideType.friendCard),
            ("语音输入", #imageLiteral(resourceName: "sharemore_voiceinput"), HiMeiTuanSlideType.voiceInput),
            ("卡券", #imageLiteral(resourceName: "sharemore_wallet"), HiMeiTuanSlideType.coupons)
        ]
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addSubview(moreView)
        self.addSubview(pageControl)
        
        moreView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(self)
            make.height.equalTo(197)
        }
        
        pageControl.snp.makeConstraints { (make) in
            make.left.right.equalTo(self)
            make.height.equalTo(35)
            make.bottom.equalTo(self.snp.bottom)
        }
        moreView.register(HiMeiTuanSlideCell.self, forCellWithReuseIdentifier: NSStringFromClass(HiMeiTuanSlideCell.self))
    }
}

extension HiMeiTuanSlideView : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreDataSouce.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let moreModel = moreDataSouce[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HiMeiTuanSlideCell.self), for: indexPath) as? HiMeiTuanSlideCell
        cell?.model = moreModel
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moreModel = moreDataSouce[indexPath.item]
        delegate?.chatMoreView(moreView: self, didSeletedType: moreModel.type)
    }
    
}
extension HiMeiTuanSlideView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.x
        let pageWidth = scrollView.frame.size.width
        if pageWidth > 0 {
            let page = floor(contentOffset / pageWidth)
            pageControl.currentPage = Int(page)
        }
    }
}
