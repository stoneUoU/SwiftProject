//
//  YLZHealthCodeServiceTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

class YLZHealthCodeServiceTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YLZColorMZTBlueView;
        self.setUI();
    }
    
    lazy var dataArrays:Array<String> = {
        var dataArrays = Array<String>();
        dataArrays.append(contentsOf: ["健康报告","为家人申领","扫张贴码","疫苗接种预约","疫苗接种查询","医保电子凭证","申领张贴码","申领机构张贴码","通信行程卡","疫情防控服务"]);
        return dataArrays
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.contentView.addSubview(self.bgView)
        self.bgView.addSubview(self.titleLabel);
        self.bgView.addSubview(self.collectionView);
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
        self.collectionView.snp.makeConstraints{ (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16);
            make.left.right.equalTo(self.bgView);
            make.height.equalTo(210);
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
        titleLabel.font = YLZFont.regular(size:24)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "信息说明";
        return titleLabel
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout=UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = YLZColorWhite;
        collectionView.register(YLZHealthCodeCollectionViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(YLZHealthCodeCollectionViewCell.self))
        collectionView.showsVerticalScrollIndicator=false
        collectionView.showsHorizontalScrollIndicator=false;
        collectionView.isScrollEnabled = false;
        return collectionView
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

extension YLZHealthCodeServiceTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArrays.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewCell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(YLZHealthCodeCollectionViewCell.self), for: indexPath) as! YLZHealthCodeCollectionViewCell;
        viewCell.titleString = self.dataArrays[indexPath.row];
        
        return viewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: (SCREENWIDTH - 42)/2, height: 36);
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5;
    }
    
    //  Converted to Swift 5 by Swiftify v5.0.30213 - https://objectivec2swift.com/
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

