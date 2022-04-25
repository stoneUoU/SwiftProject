//
//  YLZRouteCodeCell.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit

class YLZRouteCodeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorRouteCode;
        self.setUI();
        self.codeView.clickNum = 0;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.codeInfoView);
        self.bgView.addSubview(self.codeView);
        
        self.setMas();
    }
    
    func setMas() {
    }
    
    lazy var bgView:UIView = {[weak self] in
        let bgView = UIView()
        bgView.frame = CGRect.init(x: 24, y: 0, width: SCREENWIDTH - 48, height: 520)
        bgView.backgroundColor = YLZColorWhite;
        bgView.layer.masksToBounds = true;
        bgView.layer.cornerRadius = 12.0;
        bgView.layer.shadowColor = UIColor.init(56/255.0, 136/255.0, 221/255.0, 0.1).cgColor;
        bgView.layer.shadowOffset = CGSize.init(width: 0, height: 6);
        bgView.layer.shadowOpacity = 1;
        bgView.layer.shadowRadius = 12;
        return bgView
    }()
    
    lazy var codeInfoView:YLZRouteCodeCellInfoView = {[weak self] in
        var codeInfoView = YLZRouteCodeCellInfoView()
        codeInfoView.frame = CGRect.init(x: 0, y: 0, width: SCREENWIDTH - 48, height: 76);
        return codeInfoView
    }()
    
    lazy var codeView:YLZRouteCodeCellView = {[weak self] in
        var codeView = YLZRouteCodeCellView()
        codeView.frame = CGRect.init(x: 16, y: 76, width: SCREENWIDTH - (48+32), height: 380);
        return codeView
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

extension YLZRouteCodeCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}


