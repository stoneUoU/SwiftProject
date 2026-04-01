//
//  HiMeiTuanHomeViewController.swift
//  SwiftProject
//
//  Created by stone on 2026/3/31.
//

import UIKit
import SnapKit
import SDWebImage

// MARK: - 美团首页主控制器
class HiMeiTuanHomeViewController: UIViewController {
    
    // 顶部导航栏
    private lazy var statusView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
        return view
    }()
    
    private lazy var navigationView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.8, blue: 0, alpha: 1)
        return view
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.text = "软件园二期"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    private lazy var locationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "location.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "MeiTuan"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("搜索", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    lazy var moreView: HiChatMoreView = { [unowned self] in
        let moreV = HiChatMoreView()
        moreV.delegate = self
        return moreV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        // 添加顶部导航栏
        self.view.addSubview(self.statusView)
        self.view.addSubview(self.navigationView)
        navigationView.addSubview(locationIcon)
        navigationView.addSubview(locationLabel)
        navigationView.addSubview(titleLabel)
        navigationView.addSubview(searchButton)
        navigationView.addSubview(menuButton)
        
        self.view.addSubview(moreView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.statusView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(HiStatusBarH)
        }
        // 顶部导航栏约束
        navigationView.snp.makeConstraints { make in
            make.top.equalTo(self.statusView.snp.bottom);
            make.left.right.equalToSuperview()
            make.height.equalTo(HiNavigationBarH)
        }
        
        locationIcon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.left.equalTo(locationIcon.snp.right).offset(5)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        searchButton.snp.makeConstraints { make in
            make.right.equalTo(menuButton.snp.left).offset(-15)
            make.centerY.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        moreView.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.view)
            make.height.equalTo(216.0)
            make.top.equalTo(self.navigationView.snp.bottom)
        }
    }
    
    private func loadData() {
        
    }
}

extension HiMeiTuanHomeViewController : HiChatMoreViewDelegate {
    func chatMoreView(moreView: HiChatMoreView, didSeletedType type: HiChatMoreType) {
        if type == .pic {
        } else if type == .sight {  // 小视频
        } else if type == .video {  // 视频聊天
        }
    }
}
