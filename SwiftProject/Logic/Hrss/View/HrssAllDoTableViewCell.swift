//
//  HrssAllDoTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import UIKit

class HrssAllDoTableViewCell: UITableViewCell {
    
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
        self.bgView.addSubview(self.switchBtn)
        self.bgView.addSubview(self.menuView)
        self.menuView.addSubview(self.tableView)
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
        self.switchBtn.snp.makeConstraints{ (make) in
            make.centerY.equalTo(self.titleLabel);
            make.right.equalTo(self.bgView.snp.right).offset(-16)
        }
        self.menuView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(self.bgView)
            make.left.equalTo(self.bgView.snp.left).offset(12)
            make.size.equalTo(CGSize(width: HiSCREENWIDTH - 56, height: 156))
        }
        self.tableView.snp.makeConstraints{ (make) in
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
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size:18)
        titleLabel.textColor = YLZColorMZTBlueView
        titleLabel.text = "大家都在办";
        return titleLabel
    }()
    fileprivate lazy var switchBtn: UIButton = {
        let switchBtn = UIButton()
        switchBtn.titleLabel?.font = YLZFont.regular(size:15)
        switchBtn.setTitleColor(YLZColorMZTBlueView, for: .normal)
        switchBtn.setImageAndTitle(imageName:"ic_online_switch", title: "换一换", type: .Positionleft, Space: 6)
        switchBtn.addTarget(self, action: #selector(toOperate(_:)), for: .touchUpInside);
        return switchBtn
    }()
    lazy var menuView:UIView = {[weak self] in
        let menuView = UIView()
        return menuView
    }()
    public lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = YLZColorWhite;
        tableView.tableHeaderView = UIView.init();
        tableView.isScrollEnabled = false;
        tableView.separatorStyle = .none;
        tableView.register(HrssAllDoSonTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HrssAllDoSonTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
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

extension HrssAllDoTableViewCell {
    @objc func toOperate(_ sender: UIButton) {
        
    }
}

extension HrssAllDoTableViewCell:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HrssAllDoSonTableViewCell.self)) as? HrssAllDoSonTableViewCell
        if viewCell == nil {
            viewCell = HrssAllDoSonTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HrssAllDoSonTableViewCell.self))
        }
        viewCell?.separatorView.isHidden = indexPath.section == 2;
        return viewCell!;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001;
    }
}


