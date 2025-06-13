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
        let loopView = HiLoopView(scrollDirection: .vertical)
        loopView.dataSourse = self
        loopView.register(HrssLoopNoticeCell.self, forItemReuseIdentifier: String(describing: HrssLoopNoticeCell.self))
        loopView.pixelsPerSecond = 24;
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

extension HrssNoticeTableViewCell:HiLoopViewDataSource {
    func numberOfItems(in marqueeView: HiLoopView) -> Int {
        return self.loopModels.chunked(into: 2).count
    }
    func marqueeView(_ marqueeView: HiLoopView, itemForIndexAt index: Int) -> HiLoopViewItem {
        let item = marqueeView.dequeueReusableItem(withIdentifier: String(describing: HrssLoopNoticeCell.self)) as! HrssLoopNoticeCell
        item.model = self.loopModels.chunked(into: 2)[index];
        return item
    }
    
    func marqueeView(_ marqueeView: HiLoopView, itemSizeForIndexAt index: Int) -> CGSize {
        return CGSize(width: HiSCREENWIDTH-(36+72),height: 48);
    }
}
