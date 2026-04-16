//
//  MedicineBoxPopup.swift
//  SwiftProject
//
//  Created by stone on 2026/4/16.
//
// 药品数据模型
struct MedicineItem {
    let name: String
    let price: String
    let originalPrice: String
    let quantity: Int
}

// 底部弹窗类
class MedicineBoxPopup: UIView, UITableViewDataSource, UITableViewDelegate {
    
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
    
    // 药品列表
    private let medicineTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        return tableView
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
    
    // 药品数据
    private var medicines: [MedicineItem] = [
        MedicineItem(name: "999感冒灵颗粒 10g*9袋/盒", price: "¥12.6", originalPrice: "¥12.6", quantity: 2),
        MedicineItem(name: "999感冒灵颗粒 10g*9袋/盒", price: "¥6.6", originalPrice: "¥12", quantity: 1),
        MedicineItem(name: "健胃消食片 0.8g*32片/盒", price: "¥8.8", originalPrice: "¥15", quantity: 1),
        MedicineItem(name: "布洛芬缓释胶囊 0.3g*10粒/盒", price: "¥15.8", originalPrice: "¥22", quantity: 1)
    ]
    
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
            make.height.equalTo(400)
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
        
        // 添加药品列表
        contentView.addSubview(medicineTableView)
        medicineTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.height.equalTo(200)
        }
        
        // 注册单元格
        medicineTableView.register(MedicineTableViewCell.self, forCellReuseIdentifier: "MedicineTableViewCell")
        medicineTableView.dataSource = self
        medicineTableView.delegate = self
        
        // 添加打包费
        contentView.addSubview(packingFeeLabel)
        packingFeeLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(medicineTableView.snp.bottom).offset(16)
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
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MedicineTableViewCell", for: indexPath) as! MedicineTableViewCell
        cell.medicine = medicines[indexPath.row]
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
