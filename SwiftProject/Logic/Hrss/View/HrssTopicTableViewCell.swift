//
//  HrssTopicTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import UIKit
import SwiftyJSON

class HrssTopicTableViewCell: UITableViewCell {
    
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
        self.bgView.addSubview(self.titleLabel)
        self.bgView.addSubview(self.logoImageView)
        self.bgView.addSubview(self.jobView)
        self.bgView.addSubview(self.doThingView)
        self.bgView.addSubview(self.certificateView)
        self.setMas();
    }
    
    func setMas() {
        self.bgView.snp.makeConstraints{ (make) in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        self.titleLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.bgView.snp.top).offset(16);
            make.left.equalTo(self.bgView).offset(16);
        }
        self.logoImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.bgView.snp.top);
            make.right.equalTo(self.bgView);
        }
        self.jobView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView.snp.bottom).offset(-12)
            make.left.equalTo(self.bgView.snp.left).offset(16)
            make.size.equalTo(CGSize(width: (HiSCREENWIDTH - 74)/2, height: 136))
        }
        self.doThingView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.jobView.snp.top)
            make.right.equalTo(self.bgView.snp.right).offset(-16)
            make.size.equalTo(CGSize(width: (HiSCREENWIDTH - 74)/2, height: 63))
        }
        self.certificateView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.jobView.snp.bottom)
            make.right.equalTo(self.bgView.snp.right).offset(-16)
            make.size.equalTo(CGSize(width: (HiSCREENWIDTH - 74)/2, height: 63))
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
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size:18)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "专题服务";
        return titleLabel
    }()
    
    lazy var logoImageView:UIImageView = {[weak self] in
        var logoImageView = UIImageView()
        logoImageView.image = UIImage.init(named: "ic_topic_banner")
        return logoImageView
    }()
    
    lazy var jobView:HrssTopicLeftView = {[weak self] in
        var jobView = HrssTopicLeftView()
        return jobView
    }()
    lazy var doThingView:HrssTopicRightView = {[weak self] in
        var doThingView = HrssTopicRightView()
        let model:HrssModel = HrssModel.init(json:JSON(["iconUrl":"文案文案通办","title":"跨省通办","bgUrl":"ic_topic_top_right"]));
        doThingView.model = model;
        return doThingView
    }()
    lazy var certificateView:HrssTopicRightView = {[weak self] in
        var certificateView = HrssTopicRightView()
        let model:HrssModel = HrssModel.init(json:JSON(["iconUrl":"证书、证照查询","title":"我的证书","bgUrl":"ic_topic_bottom_right"]));
        certificateView.model = model;
        return certificateView
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

extension HrssTopicTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}
