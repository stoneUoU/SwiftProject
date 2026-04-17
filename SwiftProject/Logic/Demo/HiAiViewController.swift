//
//  HiMyFooterViewController.swift
//  SwiftProject
//
//  Created by stone on 2025/12/29.
//

import UIKit
import SnapKit

class HiAiViewController: HiBaseViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private lazy var historyView: UIView = {
        let view = UIView()
        return view
    }()
    // 历史搜索标题
    private lazy var historyTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "历史搜索"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    // 清空历史按钮
    private lazy var clearHistoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("清空", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    // 历史搜索标签容器
    private lazy var historyTagsContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    // 展开/收起按钮
    private lazy var expandButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("▼", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.addTarget(self, action: #selector(toggleExpand), for: .touchUpInside)
        return button
    }()
    
    private lazy var discoveryView: UIView = {
        let view = UIView()
        return view
    }()
    // 搜索发现标题
    private lazy var discoveryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "搜索发现"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    // 换一批按钮
    private lazy var refreshButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("换一批", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    // 搜索发现标签容器
    private lazy var discoveryTagsContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    // 历史搜索数据
    private let historyTags : [String] = ["阿莫西林", "儿童感冒药", "阿司匹林", "川贝枇杷膏", "云南白药膏", "布洛芬", "头孢", "板蓝根", "儿童感冒药", "阿司匹林", "川贝枇杷膏", "云南白药膏", "布洛芬", "头孢", "板蓝根"]
    
    // 搜索发现数据
    private let discoveryTags = ["阿莫西林", "儿童感冒药", "阿司匹林", "川贝枇杷膏", "云南白药膏", "布洛芬", "头孢", "板蓝根"]
    
    // 是否展开
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStatusAndNavigationUI(centerLabelTitle: "搜索",
                                 rightButtonTitle: "",
                                 ifWhiteIMV: true,
                                 navigationColor: UIColor.color_HexStr("#4077F4"),
                                 centerLabelColor: .white,
                                 rightButtonColor: .white,
                                 ifLine: false)
        setUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if (self.historyTags.count > 0) {
                self.historyView.isHidden = false;
                self.discoveryView.snp.updateConstraints { make in
                    make.top.equalTo(self.historyView.snp.bottom).offset(24)
                }
                self.setupHistoryTags()
            } else {
                self.historyView.isHidden = true;
                self.discoveryView.snp.remakeConstraints { make in
                    make.top.equalTo(self.navigationView.snp.bottom).offset(24)
                    make.left.right.equalToSuperview()
                }
            }
            self.setupDiscoveryTags()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func setUI() {
        
        // 添加历史搜索部分:
        view.addSubview(historyView)
        historyView.addSubview(historyTitleLabel)
        historyView.addSubview(clearHistoryButton)
        historyView.addSubview(historyTagsContainer)
        historyView.addSubview(expandButton)
        
        // 添加搜索发现部分
        view.addSubview(discoveryView)
        discoveryView.addSubview(discoveryTitleLabel)
        discoveryView.addSubview(refreshButton)
        discoveryView.addSubview(discoveryTagsContainer)
        
        historyView.snp.makeConstraints { make in
            make.top.equalTo(self.navigationView.snp.bottom).offset(24)
            make.left.right.equalToSuperview()
        }
        // 设置约束
        historyTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        
        clearHistoryButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(historyTitleLabel)
        }
        
        historyTagsContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(historyTitleLabel.snp.bottom).offset(16)
            make.height.equalTo(30)
        }
        
        expandButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(historyTagsContainer.snp.bottom).offset(8)
            make.bottom.equalTo(historyView.bottom)
        }
        
        discoveryView.snp.makeConstraints { make in
            make.top.equalTo(historyView.snp.bottom).offset(24)
            make.left.right.equalToSuperview()
        }
        
        discoveryTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview()
        }
        
        refreshButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(discoveryTitleLabel)
        }
        
        discoveryTagsContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(discoveryTitleLabel.snp.bottom).offset(16)
            make.height.equalTo(30)
            make.bottom.equalTo(discoveryView.bottom)
        }
    }
    
    // 设置历史搜索标签
    private func setupHistoryTags() {
        // 清空容器
        for subview in historyTagsContainer.subviews {
            subview.removeFromSuperview()
        }
        // 计算标签数量
        let currentTags = historyTags.count > 5 ? 5 : historyTags.count
        let maxTags = isExpanded ? historyTags.count : currentTags
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        let tagHeight: CGFloat = 28
        let tagSpacing: CGFloat = 12
        let containerWidth = historyTagsContainer.bounds.width
        for i in 0..<maxTags {
            let tag = historyTags[i]
            let tagButton = createTagButton(title: tag as! String)
            // 计算标签宽度
            let tagWidth = tagButton.intrinsicContentSize.width + 24
            // 检查是否需要换行
            if currentX + tagWidth > containerWidth {
                currentX = 0
                currentY += tagHeight + tagSpacing
            }
            
            // 添加标签到容器
            historyTagsContainer.addSubview(tagButton)
            tagButton.snp.makeConstraints { make in
                make.left.equalTo(currentX)
                make.top.equalTo(currentY)
                make.width.equalTo(tagWidth)
                make.height.equalTo(tagHeight)
            }
            
            currentX += tagWidth + tagSpacing
        }
        
        // 调整容器高度
        historyTagsContainer.snp.updateConstraints { make in
            make.height.equalTo(currentY + tagHeight + 10)
        }
    }
    
    // 设置搜索发现标签
    private func setupDiscoveryTags() {
        // 清空容器
        for subview in discoveryTagsContainer.subviews {
            subview.removeFromSuperview()
        }
        
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        let tagHeight: CGFloat = 28
        let tagSpacing: CGFloat = 12
        let containerWidth = discoveryTagsContainer.bounds.width
        
        for tag in discoveryTags {
            let tagButton = createTagButton(title: tag)
            
            // 计算标签宽度
            let tagWidth = tagButton.intrinsicContentSize.width + 24
            
            // 检查是否需要换行
            if currentX + tagWidth > containerWidth {
                currentX = 0
                currentY += tagHeight + tagSpacing
            }
            
            // 添加标签到容器
            discoveryTagsContainer.addSubview(tagButton)
            tagButton.snp.makeConstraints { make in
                make.left.equalTo(currentX)
                make.top.equalTo(currentY)
                make.width.equalTo(tagWidth)
                make.height.equalTo(tagHeight)
            }
            
            currentX += tagWidth + tagSpacing
        }
        
        // 调整容器高度
        discoveryTagsContainer.snp.updateConstraints { make in
            make.height.equalTo(currentY + tagHeight + 10)
        }
    }
    
    // 创建标签按钮
    private func createTagButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        button.layer.cornerRadius = 14
        return button
    }
    
    // 切换展开/收起状态
    @objc func toggleExpand() {
        isExpanded = !isExpanded
        expandButton.setTitle(isExpanded ? "▲" : "▼", for: .normal)
        setupHistoryTags()
    }
}

//import UIKit
//import SnapKit
//
//class HiAiViewController: HiBaseViewController {
//
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
//    @objc lazy var openButton: UIButton = {
//        let openButton = UIButton.init(type: UIButton.ButtonType.custom)
//        openButton.setTitle("打开Uni小程序", for: UIControl.State.normal)
//        openButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        openButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
//        openButton.layer.borderWidth = 0.5;
//        openButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
//        openButton.layer.cornerRadius = 20;
//        openButton.layer.masksToBounds = true;
//        openButton.tag = 4;
//        openButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
//        return openButton
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = HiColorBackGround
//        setStatusAndNavigationUI(centerLabelTitle: "Ai",
//                                 rightButtonTitle: "",
//                                 ifWhiteIMV: true,
//                                 navigationColor: UIColor.color_HexStr("#4077F4"),
//                                 centerLabelColor: .white,
//                                 rightButtonColor: .white,
//                                 ifLine: false)
//        setUI()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationItem.setHidesBackButton(true, animated: true)
//        navigationController?.navigationBar.isHidden = true
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//
//    func setUI() {
//        self.view.addSubview(self.openButton)
//        
//        self.setMas();
//    }
//    
//    func setMas() {
//        self.openButton.snp.makeConstraints { (make) in
//            make.center.equalTo(self.view)
//            make.size.equalTo(CGSize.init(width: 240, height: 40))
//        }
//    }
//    
//    @objc func toExcute(_ sender: UIButton) {
//        // 显示通用弹窗
//        
//    }
//    
//    // 显示支付方式选择弹窗
//}
