//
//  HiChatMoreView.swift
//  SwiftProject
//
//  Created by stone on 2026/3/31.
//
//  GitHub: https://github.com/LinXunFeng
//  简书: http://www.jianshu.com/users/31e85e7a22a2

import UIKit

enum HiChatMoreType: Int {
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

fileprivate let kMoreCellNumberOfOneRow = 4
fileprivate let kMoreCellRow = 2
fileprivate let kMoreCellNumberOfOnePage = kMoreCellRow * kMoreCellNumberOfOneRow
fileprivate let kMoreCellID = "moreCellID"
let kChatKeyboardBgColor: UIColor = RGBA(r: 0.96, g: 0.96, b: 0.96, a: 1.0)

protocol HiChatMoreViewDelegate : NSObjectProtocol {
    func chatMoreView(moreView: HiChatMoreView, didSeletedType type: HiChatMoreType)
}

class HiChatMoreView: UIView {
    // MARK:- 代理
    weak var delegate: HiChatMoreViewDelegate?
    
    // MARK:- 懒加载
    lazy var moreView: UICollectionView = { [unowned self] in
        let collectionV = UICollectionView(frame: CGRect.zero, collectionViewLayout: HiChatHorizontalLayout(column: kMoreCellNumberOfOneRow, row: kMoreCellRow))
        collectionV.backgroundColor = kChatKeyboardBgColor
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
    
    lazy var moreDataSouce: [(name: String, icon: UIImage, type: HiChatMoreType)] = {
        return [
            ("照片", #imageLiteral(resourceName: "sharemore_pic"), HiChatMoreType.pic),
            ("相机", #imageLiteral(resourceName: "sharemore_video"), HiChatMoreType.camera),
            ("小视频", #imageLiteral(resourceName: "sharemore_sight"), HiChatMoreType.sight),
            ("视频聊天", #imageLiteral(resourceName: "sharemore_videovoip"), HiChatMoreType.video),
            ("红包", #imageLiteral(resourceName: "sharemore_wallet"), HiChatMoreType.wallet),
            ("转账", #imageLiteral(resourceName: "sharemorePay"), HiChatMoreType.pay),
            ("位置", #imageLiteral(resourceName: "sharemore_location"), HiChatMoreType.location),
            ("收藏", #imageLiteral(resourceName: "sharemore_myfav"), HiChatMoreType.myfav),
            ("个人名片", #imageLiteral(resourceName: "sharemore_friendcard"), HiChatMoreType.friendCard),
            ("语音输入", #imageLiteral(resourceName: "sharemore_voiceinput"), HiChatMoreType.voiceInput),
            ("卡券", #imageLiteral(resourceName: "sharemore_wallet"), HiChatMoreType.coupons)
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
        self.backgroundColor = kChatKeyboardBgColor
        moreView.contentSize = CGSize(width:HiSCREENWIDTH * 2, height: moreView.height)
        // 注册itemID
        moreView.register(HiChatMoreCell.self, forCellWithReuseIdentifier: kMoreCellID)
        
    }
}

extension HiChatMoreView : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moreDataSouce.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let moreModel = moreDataSouce[indexPath.item]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kMoreCellID, for: indexPath) as? HiChatMoreCell
        
        cell?.model = moreModel
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let moreModel = moreDataSouce[indexPath.item]
        delegate?.chatMoreView(moreView: self, didSeletedType: moreModel.type)
    }
    
}
extension HiChatMoreView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.x
        let page = contentOffset / scrollView.frame.size.width + (Int(contentOffset) % Int(scrollView.frame.size.width) == 0 ? 0 : 1)
        pageControl.currentPage = Int(page)
    }
}
