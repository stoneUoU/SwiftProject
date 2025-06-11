//
//  HrssViewController.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import UIKit
import MBProgressHUD

class HrssViewController:UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    //MARK: LifeCycle
    deinit {
            
    }
        
    //视图初始化
    override func loadView() {
        super.loadView()
    }
        
    // 当加载视图结束时调用该方法
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YLZColorWhite;
        self.setUI()
    }
        
    // 视图将要显示时调用该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    // 当视图已经显示时调用该方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = true;
    }
        
    // 当视图将要消失时调用该方法
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    // 当时图已经消失时调用该方法
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
        
    // 当接收到内存警告时会执行这个方法
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    //MARK: Public Method
      
    //MARK: Private Method

    func setUI() {
        self.view.addSubview(self.tableView);
        self.view.addSubview(self.statusView);
        self.view.addSubview(self.navigationView);
        self.navigationView.addSubview(self.titleLabel);
        self.navigationView.addSubview(self.msgButton);
        self.navigationView.addSubview(self.searchView);
        self.searchView.addSubview(self.loopImageView);
        self.searchView.addSubview(self.loopLabel);
        
        self.setMas();
    }
        
    func setMas() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        self.statusView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiStatusBarH))
        }
        self.navigationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: HiSCREENWIDTH, height: HiNavigationBarH))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView);
            make.left.equalTo(self.navigationView.snp.left).offset(16)
        }
        self.msgButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.right.equalTo(self.navigationView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 20, height: 18))
        }
        self.searchView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.left.equalTo(self.titleLabel.snp.right).offset(16)
            make.right.equalTo(self.msgButton.snp.left).offset(-16);
            make.height.equalTo(28);
        }
        self.loopImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.searchView)
            make.left.equalTo(self.searchView.snp.left).offset(16)
        }
        self.loopLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.searchView)
            make.left.equalTo(self.loopImageView.snp.right).offset(16)
        }
    }
        
    //MARK: lazy load
    lazy var statusView: UIView = {[weak self] in
        let statusView = UIView(frame:.zero)
//        statusView.backgroundColor = YLZColorMZTBlueView;
        return statusView
    }()
    lazy var navigationView: UIView = {[weak self] in
        let navigationView = UIView(frame:.zero)
//        navigationView.backgroundColor = YLZColorMZTBlueView;
        return navigationView
    }()
    lazy var titleLabel: UILabel = {[weak self] in
        let titleLabel = UILabel(frame:.zero)
        titleLabel.text = "厦门市";
        titleLabel.textAlignment = .center
        titleLabel.textColor = YLZColorWhite;
        titleLabel.font = YLZFont.medium(size: 16);
        return titleLabel
    }()
    lazy var searchView: UIView = {[weak self] in
        let searchView = UIView(frame:.zero)
        searchView.layer.cornerRadius = 14.0
        searchView.layer.masksToBounds = true
        searchView.backgroundColor = YLZColorWhite;
        return searchView
    }()
    lazy var loopImageView: UIImageView = {[weak self] in
        let loopImageView = UIImageView(frame:.zero)
        loopImageView.image = UIImage.init(named: "icon_sousuo");
        return loopImageView
    }()
    lazy var loopLabel: UILabel = {[weak self] in
        let loopLabel = UILabel(frame:.zero)
        loopLabel.text = "新版掌上12333上线！";
        loopLabel.textAlignment = .center
        loopLabel.textColor = YLZColorTitleThree;
        loopLabel.font = YLZFont.regular(size: 12);
        return loopLabel
    }()
    lazy var msgButton: UIButton = {[weak self] in
        let msgButton = UIButton(type: .custom)
        msgButton.tag = 0
        msgButton.setImage(UIImage(named: "ic_home_header_message"), for: .normal)
        msgButton.setTitleColor(YLZColorTitleTwo, for: .normal)
        msgButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return msgButton
    }()
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    public lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none;
        tableView.backgroundColor = YLZColorBackGround;
        tableView.tableHeaderView = self.tableHeaderView;
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never;
            tableView.estimatedSectionHeaderHeight = 0;
            tableView.estimatedSectionFooterHeight = 0;
        }else {
            self.automaticallyAdjustsScrollViewInsets = false;
        }
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.register(HrssAllDoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HrssAllDoTableViewCell.self))
        tableView.register(HrssEasyManTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HrssEasyManTableViewCell.self))
        tableView.register(HrssTopicTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HrssTopicTableViewCell.self))
        tableView.register(HrssNoticeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HrssNoticeTableViewCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()
    lazy var tableHeaderView: HrssTableHeaderView = {[weak self] in
        let tableHeaderView = HrssTableHeaderView(frame:CGRectMake(0, 0, HiSCREENWIDTH, HiStatusBarAndNavigationBarH + 354))
        return tableHeaderView
    }()
}

extension HrssViewController:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 70;
        } else if (indexPath.section == 1) {
            return 198;
        } else if (indexPath.section == 2) {
            return 182;
        } else if (indexPath.section == 3) {
            return 197;
        } else {
            return 32;
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HrssNoticeTableViewCell.self)) as? HrssNoticeTableViewCell
            if viewCell == nil {
                viewCell = HrssNoticeTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HrssNoticeTableViewCell.self))
            }
            return viewCell!;
            
        } else if (indexPath.section == 1) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HrssTopicTableViewCell.self)) as? HrssTopicTableViewCell
            if viewCell == nil {
                viewCell = HrssTopicTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HrssTopicTableViewCell.self))
            }
            return viewCell!;
        } else if (indexPath.section == 2) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HrssEasyManTableViewCell.self)) as? HrssEasyManTableViewCell
            if viewCell == nil {
                viewCell = HrssEasyManTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HrssEasyManTableViewCell.self))
            }
            return viewCell!;
        } else if (indexPath.section == 3) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HrssAllDoTableViewCell.self)) as? HrssAllDoTableViewCell
            if viewCell == nil {
                viewCell = HrssAllDoTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HrssAllDoTableViewCell.self))
            }
            return viewCell!;
        } else {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
            if viewCell == nil {
                viewCell = UITableViewCell(style: .default, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            }
            return viewCell!;
        }
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
        return 10;
    }
}

//MARK: IB-Action
extension HrssViewController {
    @objc func toOperate(sender: UIButton) {
        self.navigationController?.popViewController(animated: true);
    }
    
    @objc func toExcute(sender: UITapGestureRecognizer) {
//        debugPrint("toExcute");
        self.navigationController?.popViewController(animated: true);
    }
}
//MARK: Notice
extension HrssViewController {
    
}
