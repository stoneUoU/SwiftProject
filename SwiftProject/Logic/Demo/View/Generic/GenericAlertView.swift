//
//  GenericAlertView.swift
//  SwiftProject
//
//  Created by stone on 2026/4/16.
//

// 通用弹窗类
class GenericAlertView: UIView {
    
    // 回调闭包
    typealias AlertCallback = (Bool) -> Void
    
    // 背景遮罩
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isUserInteractionEnabled = true
        return view
    }()
    
    // 内容容器
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    // 关闭按钮
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    // 标题标签
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 内容标签
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // 确定按钮
    private let confirmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.47, blue: 0.98, alpha: 1.0)
        button.layer.cornerRadius = 8
        return button
    }()
    
    // 取消按钮
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(red: 0.0, green: 0.47, blue: 0.98, alpha: 1.0), for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.0, green: 0.47, blue: 0.98, alpha: 1.0).cgColor
        button.layer.cornerRadius = 8
        return button
    }()
    
    // 回调
    private var callback: AlertCallback?
    
    // 父视图
    private weak var parentView: UIView?
    
    // 初始化方法
    init(parentView: UIView, title: String, message: String, confirmTitle: String = "确定", cancelTitle: String = "取消", callback: @escaping AlertCallback) {
        self.parentView = parentView
        self.callback = callback
        super.init(frame: .zero)
        
        // 设置标题和内容
        titleLabel.text = title
        messageLabel.text = message
        confirmButton.setTitle(confirmTitle, for: .normal)
        cancelButton.setTitle(cancelTitle, for: .normal)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 设置UI
    private func setupUI() {
        guard let parentView = parentView else { return }
        
        // 添加到父视图
        parentView.addSubview(self)
        self.frame = parentView.bounds
        self.isUserInteractionEnabled = true
        
        // 添加背景遮罩
        addSubview(backgroundView)
        backgroundView.frame = bounds
        
        // 添加内容容器
        addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(280)
            make.height.greaterThanOrEqualTo(150)
        }
        
        // 添加关闭按钮
        contentView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.top.equalToSuperview().offset(12)
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        // 添加标题标签
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(24)
        }
        
        // 添加内容标签
        contentView.addSubview(messageLabel)
        messageLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        
        // 添加确定按钮
        contentView.addSubview(confirmButton)
        confirmButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(messageLabel.snp.bottom).offset(24)
            make.height.equalTo(40)
        }
        
        // 添加取消按钮
        contentView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(24)
            make.top.equalTo(confirmButton.snp.bottom).offset(12)
            make.height.equalTo(40)
            make.bottom.equalToSuperview().offset(-24)
        }
        
        // 添加点击事件
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        
        // 初始状态
        contentView.alpha = 0
        contentView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
    
    // 显示弹窗
    func show() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 1.0
            self.contentView.alpha = 1.0
            self.contentView.transform = .identity
        })
    }
    
    // 关闭弹窗
    @objc private func close() {
        dismiss(withConfirm: false)
    }
    
    // 确定
    @objc private func confirm() {
        dismiss(withConfirm: true)
    }
    
    // 取消
    @objc private func cancel() {
        dismiss(withConfirm: false)
    }
    
    // 消失
    private func dismiss(withConfirm: Bool) {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 0.0
            self.contentView.alpha = 0
            self.contentView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: {
            _ in
            self.removeFromSuperview()
            self.callback?(withConfirm)
        })
    }
}

//
//let alert = GenericAlertView(parentView: view, title: "温馨提示", message: "确定删除这个地址?", confirmTitle: "确定", cancelTitle: "取消") { [weak self] confirmed in
//    if confirmed {
//        print("用户点击了确定")
//        // 这里可以添加删除地址的逻辑
//    } else {
//        print("用户点击了取消")
//        // 这里可以添加取消操作的逻辑
//    }
//}
//alert.show()
