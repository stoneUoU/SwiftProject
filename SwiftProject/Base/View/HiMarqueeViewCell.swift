//
//  HiMarqueeViewCell.swift
//  Hi-Kit-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit

open class HiMarqueeViewCell: UIView {
    
    @objc open private(set) var reuseIdentifier: String?
    
    public required init(reuseIdentifier: String?) {
        self.reuseIdentifier = reuseIdentifier
        super.init(frame: .zero)
//        self.setUI()
    }
    
    func setUI() {
        self.setMas()
    }
    
    func setMas() {
        
    }
    
    public required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    deinit {
    }
}
