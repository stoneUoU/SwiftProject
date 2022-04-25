//
//  YLZRouteCodeViewController.swift
//  SwiftProject
//
//  Created by stone on 2022/4/24.
//

import UIKit
import MBProgressHUD

class YLZRouteCodeViewController:UIViewController {

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
        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        //纯文本模式
        hud.mode = .indeterminate;
//        hud.bezelView.backgroundColor = YLZColorTitleTwo;
        //设置提示标题
        hud.label.text = "加载中..."
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            hud.hide(animated: true);
            self.routeCodeView.isLoading = false;
            self.routeCodeView.tableView.reloadData();
        }
    }
        
    // 视图将要显示时调用该方法
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        
    // 当视图已经显示时调用该方法
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        self.view.addSubview(self.statusView);
        self.view.addSubview(self.navigationView);
        self.navigationView.addSubview(self.titleLabel);
        self.navigationView.addSubview(self.operateView);
        self.operateView.addSubview(self.moreButton);
        self.operateView.addSubview(self.separatorView);
        self.operateView.addSubview(self.shutButton);
        
        self.view.addSubview(self.routeCodeView);
        self.setMas();
    }
        
    func setMas() {
        self.statusView.snp.makeConstraints { (make) in
            make.top.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: SCREENWIDTH, height: StatusBarH))
        }
        self.navigationView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusView.snp.bottom)
            make.left.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: SCREENWIDTH, height: NavigationBarH))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.center.equalTo(self.navigationView);
        }
        self.operateView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.navigationView)
            make.right.equalTo(self.navigationView.snp.right).offset(-16);
            make.size.equalTo(CGSize.init(width: 80, height: 30))
        }
        self.separatorView.snp.makeConstraints { (make) in
            make.center.equalTo(self.operateView)
            make.size.equalTo(CGSize.init(width: 0.5, height: 16))
        }
        self.moreButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.operateView)
            make.right.equalTo(self.separatorView.snp.left).offset(-8);
        }
        self.shutButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.operateView)
            make.left.equalTo(self.separatorView.snp.right).offset(8);
        }
        self.routeCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(self.navigationView.snp.bottom);
            make.left.right.bottom.equalTo(self.view);
        }
    }
        
    //MARK: lazy load
    lazy var statusView: UIView = {[weak self] in
        let statusView = UIView(frame:.zero)
        statusView.backgroundColor = YLZColorWhite;
        return statusView
    }()
    lazy var navigationView: UIView = {[weak self] in
        let navigationView = UIView(frame:.zero)
        navigationView.backgroundColor = YLZColorWhite;
        return navigationView
    }()
    lazy var titleLabel: UILabel = {[weak self] in
        let titleLabel = UILabel(frame:.zero)
        titleLabel.text = "福建健康码";
        titleLabel.textAlignment = .center
        titleLabel.textColor = YLZColorTitleOne;
        titleLabel.font = YLZFont.regular(size: 18);
        return titleLabel
    }()
    lazy var operateView: UIView = {[weak self] in
        let operateView = UIView(frame:.zero)
        operateView.layer.cornerRadius = 15.0
        operateView.layer.masksToBounds = true
        operateView.layer.borderWidth = 0.5
        operateView.layer.borderColor = YLZColorTitleThree.cgColor
        return operateView
    }()
    lazy var moreButton: UIButton = {[weak self] in
        let moreButton = UIButton(type: .custom)
        moreButton.tag = 0
        moreButton.setImage(UIImage(named: "ylz_mirco_more"), for: .normal)
        moreButton.setTitleColor(YLZColorTitleTwo, for: .normal)
        moreButton.addTarget(self, action:#selector(self?.toOperate(sender:)), for: .touchUpInside)
        return moreButton
    }()
    lazy var separatorView: UIView = {[weak self] in
        let separatorView = UIView(frame:.zero)
        separatorView.backgroundColor = YLZColorTitleThree;
        return separatorView
    }()
    lazy var shutButton: UIButton = {[weak self] in
        let shutButton = UIButton(type: .custom)
        shutButton.tag = 0
        shutButton.setImage(UIImage(named: "ylz_mirco_shut"), for: .normal)
        shutButton.setTitleColor(YLZColorTitleTwo, for: .normal)
        shutButton.addTarget(self, action: #selector(self?.toOperate(sender:)), for: .touchUpInside)
        return shutButton
    }()
    lazy var routeCodeView: YLZRouteCodeView = {[weak self] in
        let routeCodeView = YLZRouteCodeView(frame:.zero)
        routeCodeView.routeCodeViewDelegate = self;
        routeCodeView.handle = { [weak self]  in
        };
        return routeCodeView
    }()
}

//MARK: IB-Action
extension YLZRouteCodeViewController {
    @objc func toOperate(sender: UIButton) {
    }
}
//MARK: Notice
extension YLZRouteCodeViewController {
    
}
//MARK: Delegate
extension YLZRouteCodeViewController:YLZRouteCodeViewDelegate {
    
    func toOperate(view: YLZRouteCodeView) {
        
    }
}
