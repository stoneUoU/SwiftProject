//
//  YLZHealthCodeTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

class YLZHealthCodeTableViewCell: UITableViewCell {
    
    /**
     * 0 : 绿码
     * 1 : 橙码
     * 2 : 红码
     */
    var clickNum: Int? {
        didSet {
            if (clickNum == 0) {
                self.format(textString:"健康状况核验 未见异常【绿码】", location: 7, fontColor: UIColor.color_HexStr("6ab069"))
                self.qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 100), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#6ab069"))
            } else if (clickNum == 1) {
                self.format(textString:"健康状况核验 建议隔离【橙码】", location: 7, fontColor: UIColor.color_HexStr("F7ce44"))
                self.qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 100), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#F7ce44"))
            } else {
                self.format(textString:"健康状况核验 强制隔离【红码】", location: 7, fontColor: UIColor.color_HexStr("eb3223"))
                self.qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 100), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#eb3223"))
            }
        }
    }
    
    func format(textString: String, location: Int, fontColor: UIColor) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.0
        let dic = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        // 配置富文本
        let attributeStr = NSMutableAttributedString(string: textString, attributes: dic)
        attributeStr.addAttribute(.foregroundColor, value: YLZColorTitleOne, range: NSRange(location: 0, length: location))
        attributeStr.addAttribute(.font, value: YLZFont.regular(size:18), range: NSRange(location: 0, length: location))
        attributeStr.addAttribute(.foregroundColor, value: fontColor, range: NSRange(location: location, length: textString.count - location))
        attributeStr.addAttribute(.font, value: YLZFont.bold(size:18), range: NSRange(location: location, length: textString.count - location))
        self.stateLabel.attributedText = attributeStr
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorMZTBlueView;
        self.setUI();
        self.startTimer();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.stateLabel)
        self.bgView.addSubview(self.timeLabel)
        self.bgView.addSubview(self.leftImageView)
        self.bgView.addSubview(self.rightImageView)
        self.bgView.addSubview(self.codeGradientView)
        self.bgView.addSubview(self.qrCodeImageView)
        self.bgView.addSubview(self.logoImageView)
        self.bgView.addSubview(self.codeLabel)
        
        self.bgView.addSubview(self.fastButton)
        self.bgView.addSubview(self.vaccineButton)
        self.bgView.addSubview(self.familyButton)
        self.bgView.addSubview(self.onlineButton)
        self.bgView.addSubview(self.serviceButton)
        
        self.bgView.addSubview(self.dashImageView)
        
        self.setMas();
    }
    
    func setMas() {
        self.bgView.snp.makeConstraints{ (make) in
            make.top.bottom.equalTo(self.contentView)
            make.left.equalTo(self.contentView.snp.left).offset(16)
            make.right.equalTo(self.contentView.snp.right).offset(-16)
        }
        self.leftImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.bgView.snp.top).offset(72);
            make.left.equalTo(self.bgView);
        }
        self.rightImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.bgView.snp.top).offset(72);
            make.right.equalTo(self.bgView);
        }
        self.stateLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.bgView.snp.top).offset(16);
            make.centerX.equalTo(self.bgView);
        }
        self.timeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.stateLabel.snp.bottom).offset(8);
            make.centerX.equalTo(self.bgView);
        }
        self.codeGradientView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.timeLabel.snp.bottom).offset(8);
            make.centerX.equalTo(self.bgView);
            make.size.equalTo(CGSize.init(width: 240, height: 240));
        }
        self.qrCodeImageView.snp.makeConstraints{ (make) in
            make.center.equalTo(self.codeGradientView);
            make.size.equalTo(CGSize.init(width: 230, height: 230));
        }
        self.logoImageView.snp.makeConstraints{ (make) in
            make.center.equalTo(self.qrCodeImageView);
            make.size.equalTo(CGSize.init(width: 40, height: 40));
        }
        self.codeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.codeGradientView.snp.bottom).offset(12);
            make.centerX.equalTo(self.bgView);
        }
        
        self.fastButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.codeLabel.snp.bottom).offset(12);
            make.centerX.equalTo(self.bgView).offset(-72);
            make.size.equalTo(CGSize.init(width: 136, height: 32));
        }
        self.vaccineButton.snp.makeConstraints{ (make) in
            make.top.equalTo(self.codeLabel.snp.bottom).offset(12);
            make.centerX.equalTo(self.bgView).offset(72);
            make.size.equalTo(CGSize.init(width: 136, height: 32));
        }
        self.familyButton.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView.snp.bottom);
            make.left.equalTo(self.bgView);
            make.size.equalTo(CGSize.init(width: (SCREENWIDTH - 32)/3, height: 44));
        }
        self.onlineButton.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView.snp.bottom);
            make.left.equalTo(self.familyButton.snp.right);
            make.size.equalTo(CGSize.init(width: (SCREENWIDTH - 32)/3, height: 44));
        }
        self.serviceButton.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView.snp.bottom);
            make.left.equalTo(self.onlineButton.snp.right);
            make.size.equalTo(CGSize.init(width: (SCREENWIDTH - 32)/3, height: 44));
        }
        self.dashImageView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.familyButton.snp.top);
            make.left.equalTo(self.bgView.snp.left).offset(12);
            make.right.equalTo(self.bgView.snp.right).offset(-12);
            make.height.equalTo(2);
        }
        
        self.codeGradientView.layoutIfNeeded();
        self.dashImageView.layoutIfNeeded();
        let healthCodeViewLayer = CAGradientLayer().healthCodeViewLayer();
        healthCodeViewLayer.frame = CGRect.init(x: 0, y: 0, width: 240, height: 240)
        self.codeGradientView.layer.insertSublayer(healthCodeViewLayer, at: 0)
        YLZView.drawLine(imageView: self.dashImageView, withDashColor: YLZColorTitleThree);
    }
    
    // TODO : 第一种Timer的创建
    func startTimer() -> Void {
        if #available(iOS 10.0, *) {
            let timer = Timer.init(timeInterval: 1.0, repeats:true) { (kTimer) in
                self.timeLabel.text = "\(self.formatDate())";
            }
            RunLoop.current.add(timer, forMode: .common)
            // TODO : 启动定时器
            timer.fire()
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    func formatDate() ->String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let dateNow = Date()
        let currentString = formatter.string(from: dateNow)
        return currentString;
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
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
    
    lazy var leftImageView:UIImageView = {[weak self] in
        let leftImageView = UIImageView()
        leftImageView.image = UIImage.init(named: "ylz_mzt_left")
        return leftImageView
    }()
    
    lazy var rightImageView:UIImageView = {[weak self] in
        let rightImageView = UIImageView()
        rightImageView.image = UIImage.init(named: "ylz_mzt_right")
        return rightImageView
    }()
    
    lazy var stateLabel:UILabel = {[weak self] in
        var stateLabel = UILabel()
        let textString = "健康状况核验 未见异常【绿码】"
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0.0
        let dic = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ]
        // 配置富文本
        let attributeStr = NSMutableAttributedString(string: textString, attributes: dic)
        attributeStr.addAttribute(.foregroundColor, value: YLZColorTitleOne, range: NSRange(location: 0, length: 7))
        attributeStr.addAttribute(.font, value: YLZFont.regular(size: 18), range: NSRange(location: 0, length: 7))
        attributeStr.addAttribute(.foregroundColor, value: UIColor.color_HexStr("#6ab069"), range: NSRange(location: 7, length: textString.count - 7))
        attributeStr.addAttribute(.font, value: YLZFont.bold(size:18), range: NSRange(location: 7, length: textString.count - 7))
        stateLabel.attributedText = attributeStr
        return stateLabel
    }()
    
    lazy var timeLabel:UILabel = {[weak self] in
        var timeLabel = UILabel()
        timeLabel.font = YLZFont.medium(size:22)
        timeLabel.textColor = YLZColorBlue
        timeLabel.text = "\(self!.formatDate())"
        return timeLabel
    }()
    
    lazy var codeGradientView:UIView = {[weak self] in
        var codeGradientView = UIView()
        codeGradientView.layer.cornerRadius = 12.0;
        codeGradientView.layer.masksToBounds = true;
        return codeGradientView
    }()
    
    //UIColor.color_HexStr("#6ab069")
    //UIColor.color_HexStr("#F7ce44")
    //UIColor.color_HexStr("#eb3223")
    
    lazy var qrCodeImageView:UIImageView = {[weak self] in
        var qrCodeImageView = UIImageView()
        qrCodeImageView.layer.cornerRadius = 12.0;
        qrCodeImageView.layer.masksToBounds = true;
        qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 18), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#6ab069"))
        return qrCodeImageView
    }()
    
    lazy var logoImageView:UIImageView = {[weak self] in
        var logoImageView = UIImageView()
        logoImageView.layer.cornerRadius = 3.0;
        logoImageView.layer.masksToBounds = true;
        logoImageView.image = UIImage.init(named: "ylz_mzt_logo")
        return logoImageView
    }()
    
    lazy var codeLabel:UILabel = {[weak self] in
        var codeLabel = UILabel()
        codeLabel.font = YLZFont.regular(size: 16)
        codeLabel.textColor = YLZColorTitleOne
        codeLabel.text = YLZString.randomString(length: 18)
        return codeLabel
    }()
    
    lazy var fastButton:UIButton = {[weak self] in
        var fastButton = UIButton(type: .custom)
        fastButton.titleLabel?.font = YLZFont.regular(size:14)
        fastButton.layer.cornerRadius = 16;
        fastButton.layer.masksToBounds = true
        fastButton.backgroundColor = UIColor.color_HexStr("#e5ecf8");
        fastButton.setTitleColor(YLZColorMZTBlueView, for: .normal)
        fastButton.tag = 0
        fastButton.setTitle("创建桌面快捷方式", for: .normal)
        fastButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return fastButton
    }()
    lazy var vaccineButton:UIButton = {[weak self] in
        var vaccineButton = UIButton(type: .custom)
        vaccineButton.titleLabel?.font = YLZFont.regular(size:14)
        vaccineButton.layer.cornerRadius = 16;
        vaccineButton.layer.masksToBounds = true
        vaccineButton.backgroundColor = UIColor.color_HexStr("#fcf3ba");
        vaccineButton.setTitleColor(YLZColorGoldView, for: .normal)
        vaccineButton.tag = 1
        vaccineButton.setTitle("接种新冠疫苗x2", for: .normal)
        vaccineButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return vaccineButton
    }()
    lazy var familyButton:UIButton = {[weak self] in
        var familyButton = UIButton(type: .custom)
        familyButton.titleLabel?.font = YLZFont.regular(size:14)
        familyButton.setTitleColor(YLZColorMZTBlueView, for: .normal)
        familyButton.tag = 2
        familyButton.setTitle("家人健康码", for: .normal)
        familyButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return familyButton
    }()
    lazy var onlineButton:UIButton = {[weak self] in
        var onlineButton = UIButton(type: .custom)
        onlineButton.titleLabel?.font = YLZFont.regular(size:14)
        onlineButton.setTitleColor(YLZColorMZTBlueView, for: .normal)
        onlineButton.tag = 3
        onlineButton.setTitle("在线咨询", for: .normal)
        onlineButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return onlineButton
    }()
    lazy var serviceButton:UIButton = {[weak self] in
        var serviceButton = UIButton(type: .custom)
        serviceButton.titleLabel?.font = YLZFont.regular(size:14)
        serviceButton.setTitleColor(YLZColorMZTBlueView, for: .normal)
        serviceButton.tag = 4
        serviceButton.setTitle("人工客服", for: .normal)
        serviceButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return serviceButton
    }()
    
    lazy var dashImageView:UIImageView = {[weak self] in
        var dashImageView = UIImageView()
        return dashImageView
    }()
}

extension YLZHealthCodeTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}

