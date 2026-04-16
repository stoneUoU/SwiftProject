//
//  PaymentMethodPopup.swift
//  SwiftProject
//
//  Created by stone on 2026/4/16.
//

// 支付方式选择弹窗
class PaymentMethodPopup: UIView {
    
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
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    // 标题标签
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "选择支付方式"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 取消按钮
    private let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("取消", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    // 金额标签
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "¥ 61.5"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 医保移动支付标题
    private let medicalInsuranceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "医保移动支付"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // 医保移动支付选项
    private let medicalInsuranceOption: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        return view
    }()
    
    // 医保移动支付图标
    private let medicalInsuranceIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    // 医保移动支付标签
    private let medicalInsuranceLabel: UILabel = {
        let label = UILabel()
        label.text = "医保移动支付"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // 医保移动支付描述
    private let medicalInsuranceDescription: UILabel = {
        let label = UILabel()
        label.text = "医保支付金额请以医保预结算结用为准"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // 医保移动支付箭头
    private let medicalInsuranceArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        return imageView
    }()
    
    // 医保移动支付提示
    private let medicalInsuranceTip: UILabel = {
        let label = UILabel()
        label.text = "如选择医保支付，您需同意并授权白搞您的身份信息提供至微信及医保部门用于医保实名认证"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    
    // 现金支付标题
    private let cashPaymentTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "现金支付"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // 现金支付选项
    private let cashPaymentOption: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        view.layer.cornerRadius = 8
        return view
    }()
    
    // 现金支付图标
    private let cashPaymentIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    // 现金支付标签
    private let cashPaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "现金支付"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // 现金支付描述
    private let cashPaymentDescription: UILabel = {
        let label = UILabel()
        label.text = "使用微信等支付方式付款"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // 现金支付箭头
    private let cashPaymentArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        return imageView
    }()
    
    // 父视图
    private weak var parentView: UIView?
    
    // 初始化方法
    init(parentView: UIView) {
        self.parentView = parentView
        super.init(frame: .zero)
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
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(360+HiTabbarSafeBotM)
        }
        
        // 添加标题和取消按钮
        contentView.addSubview(titleLabel)
        contentView.addSubview(cancelButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
        }
        
        // 添加金额标签
        contentView.addSubview(amountLabel)
        amountLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
        }
        
        // 添加医保移动支付标题
        contentView.addSubview(medicalInsuranceTitleLabel)
        medicalInsuranceTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(amountLabel.snp.bottom).offset(24)
        }
        
        // 添加医保移动支付选项
        contentView.addSubview(medicalInsuranceOption)
        medicalInsuranceOption.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(medicalInsuranceTitleLabel.snp.bottom).offset(12)
            make.height.equalTo(60)
        }
        
        // 添加医保移动支付图标
        medicalInsuranceOption.addSubview(medicalInsuranceIcon)
        medicalInsuranceIcon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        // 添加医保移动支付标签
        medicalInsuranceOption.addSubview(medicalInsuranceLabel)
        medicalInsuranceLabel.snp.makeConstraints { make in
            make.left.equalTo(medicalInsuranceIcon.snp.right).offset(12)
            make.top.equalTo(medicalInsuranceIcon.snp.top)
        }
        
        // 添加医保移动支付描述
        medicalInsuranceOption.addSubview(medicalInsuranceDescription)
        medicalInsuranceDescription.snp.makeConstraints { make in
            make.left.equalTo(medicalInsuranceIcon.snp.right).offset(12)
            make.bottom.equalTo(medicalInsuranceIcon.snp.bottom)
        }
        
        // 添加医保移动支付箭头
        medicalInsuranceOption.addSubview(medicalInsuranceArrow)
        medicalInsuranceArrow.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        
        // 添加医保移动支付提示
        contentView.addSubview(medicalInsuranceTip)
        medicalInsuranceTip.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(medicalInsuranceOption.snp.bottom).offset(8)
        }
        
        // 添加现金支付标题
        contentView.addSubview(cashPaymentTitleLabel)
        cashPaymentTitleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(medicalInsuranceTip.snp.bottom).offset(24)
        }
        
        // 添加现金支付选项
        contentView.addSubview(cashPaymentOption)
        cashPaymentOption.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(cashPaymentTitleLabel.snp.bottom).offset(12)
            make.height.equalTo(60)
        }
        
        // 添加现金支付图标
        cashPaymentOption.addSubview(cashPaymentIcon)
        cashPaymentIcon.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        // 添加现金支付标签
        cashPaymentOption.addSubview(cashPaymentLabel)
        cashPaymentLabel.snp.makeConstraints { make in
            make.left.equalTo(cashPaymentIcon.snp.right).offset(12)
            make.top.equalTo(cashPaymentIcon.snp.top)
        }
        
        // 添加现金支付描述
        cashPaymentOption.addSubview(cashPaymentDescription)
        cashPaymentDescription.snp.makeConstraints { make in
            make.left.equalTo(cashPaymentIcon.snp.right).offset(12)
            make.bottom.equalTo(cashPaymentIcon.snp.bottom)
        }
        
        // 添加现金支付箭头
        cashPaymentOption.addSubview(cashPaymentArrow)
        cashPaymentArrow.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 16, height: 16))
        }
        
        // 添加关闭手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(close))
        backgroundView.addGestureRecognizer(tapGesture)
        
        // 添加取消按钮点击事件
        cancelButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        
        // 初始位置在屏幕下方
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.bounds.height)
    }
    
    // 显示弹窗
    func show() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 1.0
            self.contentView.transform = .identity
        })
    }
    
    // 关闭弹窗
    @objc func close() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 0.0
            self.contentView.transform = CGAffineTransform(translationX: 0, y: self.contentView.bounds.height)
        }, completion: {
            _ in
            self.removeFromSuperview()
        })
    }
}

//    let popup = MedicineBoxPopup(parentView: view)
//    let popup = PaymentMethodPopup(parentView: view)
//    popup.show()
