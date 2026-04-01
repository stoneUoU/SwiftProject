//
//  LeftTableViewCell.swift
//  Linkage
//
//  Created by LeeJay on 2017/3/3.
//  Copyright © 2017年 LeeJay. All rights reserved.
//

import UIKit

class HiLinkLeftTableViewCell: UITableViewCell {

    lazy var nameLabel = UILabel()
    private lazy var yellowView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }
    
    public var tagModel: HiRootClassFood_spu_tags? {
        didSet {
            guard let tagName = tagModel?.name else { return }
            self.nameLabel.text = tagName
        }
    }
    
    func configureUI () {
        
        nameLabel.frame = CGRect(x: 10, y: 10, width: 60, height: 40)
        nameLabel.numberOfLines = 0
        nameLabel.font = UIFont.systemFont(ofSize: 15)
        nameLabel.textColor = UIColor.black;
        nameLabel.highlightedTextColor = UIColor(253, 212, 49)
        contentView.addSubview(nameLabel)
        
        yellowView.frame = CGRect(x: 0, y: 5, width: 5, height: 45)
        yellowView.backgroundColor = UIColor(253, 212, 49)
        contentView.addSubview(yellowView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        contentView.backgroundColor = selected ? UIColor.white : UIColor(white: 0, alpha: 0.1)
        isHighlighted = selected
        nameLabel.isHighlighted = selected
        yellowView.isHidden = !selected
        
    }
}
