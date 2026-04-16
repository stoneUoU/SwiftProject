//
//  HiMyFooterViewController.swift
//  SwiftProject
//
//  Created by stone on 2025/12/29.
//

import UIKit
import SnapKit

// 底部弹窗类
class MedicineBoxPopup: UIView {
    
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
    
    // 药箱标题
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "药箱（共2件药品）"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    // 清空药箱按钮
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("清空药箱", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    // 药品列表容器
    private let medicineListContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    // 打包费标签
    private let packingFeeLabel: UILabel = {
        let label = UILabel()
        label.text = "打包费 ¥0.5 不支持医保支付"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let checkoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let checkoutDoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // 总价标签
    private let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "¥12.6 ¥24.8"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // 去结算按钮
    private let checkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("去结算", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.47, blue: 0.98, alpha: 1.0)
        button.layer.cornerRadius = 20
        return button
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
            make.height.equalTo(350)
        }
        
        // 添加标题和清空按钮
        contentView.addSubview(titleLabel)
        contentView.addSubview(clearButton)
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
        }
        
        clearButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
        }
        
        // 添加药品列表容器
        contentView.addSubview(medicineListContainer)
        medicineListContainer.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.height.equalTo(160)
        }
        
        // 添加第一个药品
        addMedicineItem(name: "999感冒灵颗粒 10g*9袋/盒", price: "¥12.6", originalPrice: "¥12.6", quantity: 2, atIndex: 0)
        
        // 添加第二个药品
        addMedicineItem(name: "999感冒灵颗粒 10g*9袋/盒", price: "¥6.6", originalPrice: "¥12", quantity: 1, atIndex: 1)
        
        // 添加打包费
        contentView.addSubview(packingFeeLabel)
        packingFeeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(medicineListContainer.snp.bottom).offset(16)
        }
        
        // 添加总价和去结算按钮
        contentView.addSubview(checkoutView)
        checkoutView.addSubview(checkoutDoView);
        checkoutDoView.addSubview(totalPriceLabel)
        checkoutDoView.addSubview(checkoutButton)
        
        checkoutView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.size.equalTo(CGSizeMake(HiSCREENWIDTH, 50+HiTabbarSafeBotM))
        }
        checkoutDoView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalToSuperview()
            make.size.equalTo(CGSizeMake(HiSCREENWIDTH, 50))
        }
        
        totalPriceLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        
        checkoutButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 120, height: 40))
        }
        
        // 添加关闭手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(close))
        backgroundView.addGestureRecognizer(tapGesture)
        
        // 初始位置在屏幕下方
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.bounds.height)
    }
    
    // 添加药品项
    private func addMedicineItem(name: String, price: String, originalPrice: String, quantity: Int, atIndex: Int) {
        let itemView = UIView()
        medicineListContainer.addSubview(itemView)
        
        // 药品图片
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 4
        itemView.addSubview(imageView)
        
        // 药品名称
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.textColor = .black
        itemView.addSubview(nameLabel)
        
        // 价格
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = UIFont.systemFont(ofSize: 14)
        priceLabel.textColor = .red
        itemView.addSubview(priceLabel)
        
        // 原价
        let originalPriceLabel = UILabel()
        originalPriceLabel.text = originalPrice
        originalPriceLabel.font = UIFont.systemFont(ofSize: 12)
        originalPriceLabel.textColor = .gray
        originalPriceLabel.attributedText = NSAttributedString(string: originalPrice, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        itemView.addSubview(originalPriceLabel)
        
        // 减少按钮
        let minusButton = UIButton(type: .system)
        minusButton.setTitle("-", for: .normal)
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = UIColor.lightGray.cgColor
        minusButton.layer.cornerRadius = 12
        itemView.addSubview(minusButton)
        
        // 数量标签
        let quantityLabel = UILabel()
        quantityLabel.text = "\(quantity)"
        quantityLabel.font = UIFont.systemFont(ofSize: 14)
        quantityLabel.textColor = .black
        quantityLabel.textAlignment = .center
        itemView.addSubview(quantityLabel)
        
        // 增加按钮
        let plusButton = UIButton(type: .system)
        plusButton.setTitle("+", for: .normal)
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor.lightGray.cgColor
        plusButton.layer.cornerRadius = 12
        itemView.addSubview(plusButton)
        
        // 设置约束
        itemView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(70)
            if atIndex == 0 {
                make.top.equalToSuperview()
            } else {
                make.top.equalTo(medicineListContainer.subviews[atIndex-1].snp.bottom)
            }
        }
        
        imageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(12)
            make.top.equalTo(imageView.snp.top)
            make.width.equalTo(150)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(imageView.snp.right).offset(12)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
        originalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLabel.snp.right).offset(8)
            make.bottom.equalTo(imageView.snp.bottom)
        }
        
        minusButton.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.right.equalTo(minusButton.snp.left).offset(-12)
            make.centerY.equalToSuperview()
            make.width.equalTo(30)
        }
        
        plusButton.snp.makeConstraints { make in
            make.right.equalTo(quantityLabel.snp.left).offset(-12)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
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

class HiAiViewController: HiBaseViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    @objc lazy var openButton: UIButton = {
        let openButton = UIButton.init(type: UIButton.ButtonType.custom)
        openButton.setTitle("打开Uni小程序", for: UIControl.State.normal)
        openButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        openButton.setTitleColor(UIColor.color_HexStr("#8676d7"), for: .normal)
        openButton.layer.borderWidth = 0.5;
        openButton.layer.borderColor = UIColor.color_HexStr("#8676d7").cgColor;
        openButton.layer.cornerRadius = 20;
        openButton.layer.masksToBounds = true;
        openButton.tag = 4;
        openButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return openButton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YLZColorBackGround
        setStatusAndNavigationUI(centerLabelTitle: "Ai",
                                 rightButtonTitle: "",
                                 ifWhiteIMV: true,
                                 navigationColor: UIColor.color_HexStr("#4077F4"),
                                 centerLabelColor: .white,
                                 rightButtonColor: .white,
                                 ifLine: false)
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func setUI() {
        self.view.addSubview(self.openButton)
        
        self.setMas();
    }
    
    func setMas() {
        self.openButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
        // 显示底部弹窗
        let popup = MedicineBoxPopup(parentView: view)
        popup.show()
    }
}
