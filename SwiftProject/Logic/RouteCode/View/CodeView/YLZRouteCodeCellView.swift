//
//  YLZRouteCodeCellView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/25.
//

import UIKit

class YLZRouteCodeCellView: UIView {
    
    public var clickNum: Int? {
        didSet {
            if (clickNum == 0) {
                self.format(textString:"绿码：健康状态为低风险", location: 0, fontColor: UIColor.color_HexStr("6ab069"))
                self.qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 100), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#6ab069"))
            } else if (clickNum == 1) {
                self.format(textString:"黄码：健康状态为中风险", location: 0, fontColor: UIColor.color_HexStr("F7ce44"))
                self.qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 100), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#F7ce44"))
            } else {
                self.format(textString:"红码：健康状态为高风险", location: 0, fontColor: UIColor.color_HexStr("eb3223"))
                self.qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 100), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#eb3223"))
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
        self.startTimer();
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    lazy var timeLabel:UILabel = {[weak self] in
        var timeLabel = UILabel()
        timeLabel.font = YLZFont.bold(size:24)
        timeLabel.textColor = YLZColorTitleOne
        timeLabel.text = "\(self!.formatDate())"
        return timeLabel
    }()
    lazy var codeGradientView:UIView = {[weak self] in
        var codeGradientView = UIView()
        codeGradientView.layer.cornerRadius = 12.0;
        codeGradientView.layer.masksToBounds = true;
        return codeGradientView
    }()
    lazy var qrCodeImageView:UIImageView = {[weak self] in
        var qrCodeImageView = UIImageView()
        qrCodeImageView.layer.cornerRadius = 12.0;
        qrCodeImageView.layer.masksToBounds = true;
        qrCodeImageView.image = UIImage.ylzQRCodeImage(content: YLZString.randomString(length: 18), logo: nil, logoFrame: CGRect.zero, size: 240, highCorrection: true, tintColor: UIColor.color_HexStr("#6ab069"))
        return qrCodeImageView
    }()
    lazy var logoView:UIView = {[weak self] in
        var logoView = UIView()
        logoView.layer.cornerRadius = 3.0;
        logoView.layer.masksToBounds = true;
        logoView.backgroundColor = .white;
        return logoView
    }()
    lazy var logoImageView:UIImageView = {[weak self] in
        var logoImageView = UIImageView()
        logoImageView.layer.cornerRadius = 3.0;
        logoImageView.layer.masksToBounds = true;
        logoImageView.image = UIImage.init(named: "ylz_code_middle_logo")
        return logoImageView
    }()
    lazy var stateLabel:UILabel = {[weak self] in
        var stateLabel = UILabel()
        return stateLabel
    }()
    lazy var operateView:UIView = {[weak self] in
        var operateView = UIView()
        operateView.layer.cornerRadius = 8.0;
        operateView.layer.masksToBounds = true;
        operateView.layer.borderColor = YLZColorLine.cgColor;
        operateView.layer.borderWidth = 0.5;
        operateView.clipsToBounds = true;
        return operateView
    }()
    
    lazy var brightCodeView:UIView = {[weak self] in
        var brightCodeView = UIView()
        brightCodeView.tag = 0;
        brightCodeView.isUserInteractionEnabled = true;
        let recognizer:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self?.toRecognizer(_:)));
        brightCodeView.addGestureRecognizer(recognizer);
        return brightCodeView
    }()
    lazy var brightImageView:UIImageView = {[weak self] in
        var brightImageView = UIImageView()
        brightImageView.image = UIImage.init(named: "ylz_qrcode_bright")
        return brightImageView
    }()
    lazy var brightLabel:UILabel = {[weak self] in
        var brightLabel = UILabel()
        brightLabel.font = YLZFont.regular(size: 12)
        brightLabel.textColor = YLZColorCodeBlue
        brightLabel.text = "亮码"
        return brightLabel
    }()
    lazy var separatorView:UIView = {[weak self] in
        var separatorView = UIView()
        separatorView.backgroundColor = YLZColorLine;
        return separatorView
    }()
    lazy var avaterView:UIView = {[weak self] in
        var avaterView = UIView()
        avaterView.tag = 1;
        avaterView.backgroundColor = YLZColorCodeButtonbgColor;
        avaterView.isUserInteractionEnabled = true;
        let recognizer:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(self?.toRecognizer(_:)));
        avaterView.addGestureRecognizer(recognizer);
        return avaterView
    }()
    lazy var avaterImageView:UIImageView = {[weak self] in
        var avaterImageView = UIImageView()
        avaterImageView.image = UIImage.init(named: "ylz_personal_info_bright")
        return avaterImageView
    }()
    lazy var avaterLabel:UILabel = {[weak self] in
        var avaterLabel = UILabel()
        avaterLabel.font = YLZFont.regular(size: 12)
        avaterLabel.textColor = YLZColorTitleOne
        avaterLabel.text = "人像"
        return avaterLabel
    }()
    lazy var avaterPicView:UIImageView = {[weak self] in
        var avaterPicView = UIImageView()
        avaterPicView.backgroundColor = YLZColorCodeButtonbgColor;
        avaterPicView.isHidden = true;
        avaterPicView.layer.cornerRadius = 8.0;
        avaterPicView.layer.masksToBounds = true;
        avaterPicView.image = UIImage.init(named: "ylz_mine_avater");
        avaterPicView.contentMode = .scaleAspectFill;
        avaterPicView.layer.shadowColor = YLZColorCodeBlue.cgColor;
        avaterPicView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        avaterPicView.layer.shadowOpacity = 1;
        avaterPicView.layer.shadowRadius = 12;
        return avaterPicView
    }()
    lazy var scanButton:UIButton = {[weak self] in
        var scanButton = UIButton(type: .custom)
        scanButton.titleLabel?.font = YLZFont.regular(size:18)
        scanButton.backgroundColor = YLZColorCodeBlue;
        scanButton.setTitleColor(YLZColorWhite, for: .normal)
        scanButton.tag = 1
        scanButton.setTitle("扫一扫", for: .normal)
        scanButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        scanButton.layer.cornerRadius = 22;
        scanButton.layer.shadowColor = YLZColorCodeBlue.cgColor;
        scanButton.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        scanButton.layer.shadowOpacity = 1;
        scanButton.layer.shadowRadius = 12;
        return scanButton
    }()
}
    
//MARK: Public Method
extension YLZRouteCodeCellView {
    func setUI() {
        self.addSubview(self.timeLabel)
        
        self.addSubview(self.operateView);
        self.operateView.addSubview(self.brightCodeView);
        self.brightCodeView.addSubview(self.brightImageView);
        self.brightCodeView.addSubview(self.brightLabel);
        self.operateView.addSubview(self.separatorView);
        self.operateView.addSubview(self.avaterView);
        self.avaterView.addSubview(self.avaterImageView);
        self.avaterView.addSubview(self.avaterLabel);
        
        self.addSubview(self.codeGradientView)
        self.addSubview(self.qrCodeImageView)
        self.addSubview(self.logoView)
        self.logoView.addSubview(self.logoImageView)
        self.addSubview(self.stateLabel);
        self.addSubview(self.avaterPicView)
        
        self.addSubview(self.scanButton)
        
        self.setMas()
    }
    func setMas() {
        self.timeLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.snp.top).offset(16);
            make.centerX.equalTo(self);
        }
        self.codeGradientView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.timeLabel.snp.bottom).offset(8);
            make.centerX.equalTo(self);
            make.size.equalTo(CGSize.init(width: 218, height: 218));
        }
        self.qrCodeImageView.snp.makeConstraints{ (make) in
            make.center.equalTo(self.codeGradientView);
            make.size.equalTo(CGSize.init(width: 208, height: 208));
        }
        self.logoView.snp.makeConstraints{ (make) in
            make.center.equalTo(self.qrCodeImageView);
            make.size.equalTo(CGSize.init(width: 32, height: 32));
        }
        self.logoImageView.snp.makeConstraints{ (make) in
            make.center.equalTo(self.logoView);
            make.size.equalTo(CGSize.init(width: 28, height: 28));
        }
        self.stateLabel.snp.makeConstraints{ (make) in
            make.top.equalTo(self.codeGradientView.snp.bottom).offset(12);
            make.centerX.equalTo(self);
        }
        
        self.operateView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.codeGradientView);
            make.left.equalTo(self.codeGradientView.snp.right).offset(-8);
            make.size.equalTo(CGSize.init(width: 48, height: 120));
        }
        self.brightCodeView.snp.makeConstraints{ (make) in
            make.top.left.right.equalTo(self.operateView);
            make.height.equalTo(60);
        }
        self.brightImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.brightCodeView.snp.top).offset(8);
            make.centerX.equalTo(self.brightCodeView);
        }
        self.brightLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.brightCodeView.snp.bottom).offset(-8);
            make.centerX.equalTo(self.brightCodeView);
        }
        self.separatorView.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.operateView);
            make.left.equalTo(self.operateView);
            make.size.equalTo(CGSize.init(width: 48, height: 0.5))
        }
        
        self.avaterView.snp.makeConstraints{ (make) in
            make.bottom.left.right.equalTo(self.operateView);
            make.height.equalTo(60);
        }
        self.avaterImageView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.avaterView.snp.top).offset(8);
            make.centerX.equalTo(self.avaterView);
        }
        self.avaterLabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.avaterView.snp.bottom).offset(-8);
            make.centerX.equalTo(self.avaterView);
        }
        
        self.avaterPicView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self.codeGradientView);
        }
        
        self.scanButton.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self);
            make.top.equalTo(self.stateLabel.snp.bottom).offset(13);
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH - 120, height: 44))
        }
        
        self.codeGradientView.layoutIfNeeded();
        let healthCodeViewLayer = CAGradientLayer().healthCodeViewLayer();
        healthCodeViewLayer.frame = CGRect.init(x: 0, y: 0, width: 218, height: 218)
        self.codeGradientView.layer.insertSublayer(healthCodeViewLayer, at: 0)
    }
}

extension YLZRouteCodeCellView {
    @objc func toRecognizer(_ sender :UITapGestureRecognizer) {
        let view:UIView = sender.view!;
        if (view.tag == 0) {
            self.brightImageView.image = UIImage.init(named: "ylz_qrcode_bright");
            self.brightLabel.textColor = YLZColorCodeBlue;
            
            self.avaterImageView.image = UIImage.init(named: "ylz_personal_info_bright");
            self.avaterLabel.textColor = YLZColorTitleTwo;
            
            self.avaterPicView.isHidden = true;
            self.codeGradientView.isHidden = false;
            
            self.brightCodeView.backgroundColor = YLZColorWhite;
            self.avaterView.backgroundColor = YLZColorCodeButtonbgColor;
            
        } else {
            self.brightImageView.image = UIImage.init(named: "ylz_qrcode_bleak");
            self.brightLabel.textColor = YLZColorTitleTwo;
            
            self.avaterImageView.image = UIImage.init(named: "ylz_personal_info_bleak");
            self.avaterLabel.textColor = YLZColorCodeBlue;
            
            self.avaterPicView.isHidden = false;
            self.codeGradientView.isHidden = true;
            
            self.brightCodeView.backgroundColor = YLZColorCodeButtonbgColor;
            self.avaterView.backgroundColor = YLZColorWhite;
        }
    }
    
    @objc func toOperate(sender: UIButton) {
        
    }
}

extension YLZRouteCodeCellView {
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
        formatter.dateFormat = "YYYY-MM-dd  HH:mm:ss"
        let dateNow = Date()
        let currentString = formatter.string(from: dateNow)
        return currentString;
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
        attributeStr.addAttribute(.font, value: YLZFont.bold(size:20), range: NSRange(location: location, length: textString.count - location))
        self.stateLabel.attributedText = attributeStr
    }
}
