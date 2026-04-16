//
//  MedicineTableViewCell.swift
//  SwiftProject
//
//  Created by stone on 2026/4/16.
//

// 药品单元格
class MedicineTableViewCell: UITableViewCell {
    
    // 药品图片
    private let medicineImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 4
        return imageView
    }()
    
    // 药品名称
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    // 价格
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .red
        return label
    }()
    
    // 原价
    private let originalPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // 减少按钮
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("-", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 12
        return button
    }()
    
    // 数量标签
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // 增加按钮
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 12
        return button
    }()
    
    // 数据模型
    var medicine: MedicineItem? {
        didSet {
            updateUI()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(medicineImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(minusButton)
        contentView.addSubview(quantityLabel)
        contentView.addSubview(plusButton)
        
        // 设置约束
        medicineImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(medicineImageView.snp.right).offset(12)
            make.top.equalTo(medicineImageView.snp.top)
            make.width.equalTo(150)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(medicineImageView.snp.right).offset(12)
            make.bottom.equalTo(medicineImageView.snp.bottom)
        }
        
        originalPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(priceLabel.snp.right).offset(8)
            make.bottom.equalTo(medicineImageView.snp.bottom)
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
    
    private func updateUI() {
        guard let medicine = medicine else { return }
        nameLabel.text = medicine.name
        priceLabel.text = medicine.price
        originalPriceLabel.attributedText = NSAttributedString(string: medicine.originalPrice, attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        quantityLabel.text = "\(medicine.quantity)"
    }
}
