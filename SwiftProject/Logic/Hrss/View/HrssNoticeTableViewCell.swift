//
//  HrssNoticeTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import UIKit
import SwiftyJSON

class HrssNoticeTableViewCell: UITableViewCell {
    var loopModels:[HrssModel] = [HrssModel.init(json:JSON(["iconUrl":"ic_notice_service_in","title":"新版掌上12333上线！"])),HrssModel.init(json:JSON(["iconUrl":"ic_info_service_in","title":"百日千万网络招聘行动！"])),HrssModel.init(json:JSON(["iconUrl":"ic_notice_service_in","title":"众志成城  共同战役！"]))];
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorBackGround;
        self.setUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.leftView)
        self.leftView.addSubview(self.leftImageView)
        self.bgView.addSubview(self.loopView)
        self.setMas();
        
        self.loopView.reloadData();
        self.loopView.start();
    }
    
    func setMas() {
        self.bgView.snp.makeConstraints{ (make) in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        self.leftView.snp.makeConstraints{ (make) in
            make.top.left.bottom.equalTo(self.bgView)
            make.width.equalTo(72)
        }
        self.leftImageView.snp.makeConstraints{ (make) in
            make.center.equalTo(self.leftView)
        }
        self.loopView.snp.makeConstraints{ (make) in
            make.centerY.right.equalTo(self.bgView)
            make.left.equalTo(self.leftView.snp.right)
            make.height.equalTo(48);
        }
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.backgroundColor = YLZColorWhite;
        bgView.layer.masksToBounds = true;
        bgView.layer.cornerRadius = 10.0;
        bgView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        bgView.layer.shadowOpacity = 1;
        bgView.layer.shadowRadius = 12;
        return bgView
    }()
    
    lazy var leftView:UIView = {[weak self] in
        let leftView = UIView()
        return leftView
    }()
    
    lazy var leftImageView:UIImageView = {[weak self] in
        let leftImageView = UIImageView()
        leftImageView.image = UIImage(named: "home_bell_with_messageinfo");
        return leftImageView
    }()
    
    lazy var loopView:HiLoopView = {[weak self] in
        let loopView = HiLoopView()
        loopView.delegate = self;
        loopView.timeIntervalPerScroll = 2.0;
        loopView.timeDurationPerScroll = 0.5;
        loopView.isTouchEnabled = true;
        loopView.pause();
        return loopView
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

extension HrssNoticeTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}

extension HrssNoticeTableViewCell:HiLoopViewDelegate {
    
    func numberOfVisibleItems(for loopView: HiLoopView!) -> UInt {
        return 2;
    }
    func numberOfData(for loopView: HiLoopView!) -> UInt {
        return UInt(self.loopModels.count)
    }
    
    func createItemView(_ itemView: UIView!, for loopView: HiLoopView!) {
        itemView.size = CGSize.init(width: HiSCREENWIDTH-(36+72), height: 24);
        let loopItemView:HrssLoopNoticeItemView = HrssLoopNoticeItemView();
        loopItemView.tag = 10001;
        loopItemView.size = CGSize.init(width: HiSCREENWIDTH-(36+72), height: 24);
        itemView.addSubview(loopItemView);
    }
    
    func updateItemView(_ itemView: UIView!, at index: UInt, for loopView: HiLoopView!) {
        let loopItemView:HrssLoopNoticeItemView = itemView.viewWithTag(10001) as! HrssLoopNoticeItemView;
        loopItemView.model = self.loopModels[Int(index)];
    }
    func didTouchItemView(at index: UInt, for loopView: HiLoopView!) {
        let model:HrssModel = self.loopModels[Int(index)];
        print("model_______\(model.title)");
    }
}
