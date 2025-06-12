//
//  HrssEasyManTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import UIKit
import SwiftyJSON

class HrssEasyManTableViewCell: UITableViewCell {
    
    var menuModels:[HrssModel] = [HrssModel.init(json:JSON(["iconUrl":"ic_easy_left","title":"扫一扫","bgUrl":"ic_easy_01"])),HrssModel.init(json:JSON(["iconUrl":"ic_easy_middle","title":"电子社保卡","bgUrl":"ic_easy_02"])),HrssModel.init(json:JSON(["iconUrl":"ic_easy_right","title":"12333","bgUrl":"ic_easy_03"]))];
    
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
        self.bgView.addSubview(self.menuView)
        self.menuView.addSubview(self.menuCollectionView)
        
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
        self.menuView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView)
            make.left.equalTo(self.bgView.snp.left).offset(12)
            make.size.equalTo(CGSize(width: HiSCREENWIDTH - 56, height: 130))
        }
        self.menuCollectionView.snp.makeConstraints{ (make) in
            make.edges.equalTo(self.menuView)
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
    lazy var menuView:UIView = {[weak self] in
        let menuView = UIView()
        return menuView
    }()
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size:18)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "便民服务";
        return titleLabel
    }()
    
    private lazy var menuCollectionView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let menuCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        menuCollectionView.register(HrssEasyManCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(HrssEasyManCollectionViewCell.self))
        menuCollectionView.showsVerticalScrollIndicator=false
        menuCollectionView.showsHorizontalScrollIndicator=false;
        menuCollectionView.isScrollEnabled = false;
        menuCollectionView.tag = 0;
        menuCollectionView.backgroundColor = .clear;
        return menuCollectionView
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

extension HrssEasyManTableViewCell {
    @objc func toOperate(sender: UIButton) {
        
    }
}

extension HrssEasyManTableViewCell:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuModels.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(HrssEasyManCollectionViewCell.self), for: indexPath) as! HrssEasyManCollectionViewCell;
        viewCell.model = self.menuModels[indexPath.row];
        return viewCell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: (HiSCREENWIDTH - 80)/3, height: 130);
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
    

