//
//  HiMyFooterViewController.swift
//  SwiftProject
//
//  Created by stone on 2025/12/29.
//

import UIKit
import SnapKit

struct HiFootprintItem {
    let title: String
    let backgroundColor: UIColor
    let iconName: String
}

class HiMyFooterViewController: HiBaseViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = HiColorBackGround
        return scrollView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = HiColorBackGround
        return view
    }()

    lazy var footprintTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "足迹"
        label.textColor = HiColorTitleOne
        label.font = HiFont.medium(size: 16)
        return label
    }()

    lazy var timelineStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 0
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = HiColorBackGround
        setStatusAndNavigationUI(centerLabelTitle: "我的足迹",
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
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(footprintTitleLabel)
        contentView.addSubview(timelineStackView)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(navigationView.snp.bottom)
            make.left.right.bottom.equalTo(view)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }

        footprintTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.left.equalTo(contentView).offset(16)
            make.right.equalTo(contentView).offset(-16)
        }

        timelineStackView.snp.makeConstraints { make in
            make.top.equalTo(footprintTitleLabel.snp.bottom).offset(16)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView.snp.bottom).offset(-24)
        }

        configureTimeline()
    }

    func configureTimeline() {
        let day5Items = [
            HiFootprintItem(title: "法定年龄退休计算器",
                            backgroundColor: colorSecondaryGray1,
                            iconName: "myfootprint_retire"),
            HiFootprintItem(title: "就业在线",
                            backgroundColor: colorSecondaryGray2,
                            iconName: "myfootprint_job"),
            HiFootprintItem(title: "全国招聘服务",
                            backgroundColor: colorSecondaryGray3,
                            iconName: "myfootprint_recruit"),
            HiFootprintItem(title: "法定年龄退休计算器",
                            backgroundColor: colorSecondaryGray1,
                            iconName: "myfootprint_retire"),
            HiFootprintItem(title: "就业在线",
                            backgroundColor: colorSecondaryGray2,
                            iconName: "myfootprint_job"),
            HiFootprintItem(title: "全国招聘服务",
                            backgroundColor: colorSecondaryGray3,
                            iconName: "myfootprint_recruit")
        ]

        let day4Items = [
            HiFootprintItem(title: "法定年龄退休计算器",
                            backgroundColor: UIColor.color_HexStr("#fff7e0"),
                            iconName: "myfootprint_retire"),
            HiFootprintItem(title: "就业在线",
                            backgroundColor: UIColor.color_HexStr("#fff0f0"),
                            iconName: "myfootprint_job"),
            HiFootprintItem(title: "全国招聘服务",
                            backgroundColor: UIColor.color_HexStr("#f3f6ff"),
                            iconName: "myfootprint_recruit")
        ]

        let firstSection = createTimelineSectionView(dateText: "12月5日", items: day5Items)
        let secondSection = createTimelineSectionView(dateText: "12月4日", items: day4Items)

        timelineStackView.addArrangedSubview(firstSection)
        timelineStackView.addArrangedSubview(secondSection)
    }

    func createTimelineSectionView(dateText: String, items: [HiFootprintItem]) -> UIView {
        let container = UIView()

        let dateLabel = UILabel()
        dateLabel.text = dateText
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
        dateLabel.font = HiFont.medium(size: 12)
        dateLabel.backgroundColor = UIColor.color_HexStr("#4077F4")
        dateLabel.layer.cornerRadius = 14
        dateLabel.layer.masksToBounds = true

        let lineView = HiFootprintDashLineView()

        container.addSubview(dateLabel)
        container.addSubview(lineView)

        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(container)
            make.left.equalTo(container).offset(16)
            make.height.equalTo(28)
            make.width.equalTo(64)
        }

        var lastCard: UIView?

        for (index, item) in items.enumerated() {
            let cardView = UIView()
            cardView.backgroundColor = item.backgroundColor
            cardView.layer.cornerRadius = 10

            let iconContainerView = UIView()
            iconContainerView.backgroundColor = .white
            iconContainerView.layer.cornerRadius = 8
            iconContainerView.layer.masksToBounds = true

            let iconView = UIImageView()
            iconView.image = UIImage(named: item.iconName)
            iconView.contentMode = .scaleAspectFit

            let titleLabel = UILabel()
            titleLabel.text = item.title
            titleLabel.textColor = HiColorTitleOne
            titleLabel.font = HiFont.regular(size: 14)

            container.addSubview(cardView)
            cardView.addSubview(iconContainerView)
            iconContainerView.addSubview(iconView)
            cardView.addSubview(titleLabel)

            cardView.snp.makeConstraints { make in
                if let last = lastCard {
                    make.top.equalTo(last.snp.bottom).offset(16)
                } else {
                    make.top.equalTo(dateLabel.snp.bottom).offset(16)
                }
                make.left.equalTo(container).offset(64)
                make.right.equalTo(container).offset(-40)
                make.height.equalTo(52)
                if index == items.count - 1 {
                    make.bottom.equalTo(container.snp.bottom).offset(-8)
                }
            }

            iconContainerView.snp.makeConstraints { make in
                make.left.equalTo(cardView).offset(12)
                make.centerY.equalTo(cardView)
                make.size.equalTo(CGSize(width: 28, height: 28))
            }

            iconView.snp.makeConstraints { make in
                make.center.equalTo(iconContainerView)
                make.size.equalTo(CGSize(width: 18, height: 18))
            }

            titleLabel.snp.makeConstraints { make in
                make.left.equalTo(iconContainerView.snp.right).offset(12)
                make.right.equalTo(cardView).offset(-16)
                make.centerY.equalTo(cardView)
            }

            lastCard = cardView
        }

        lineView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom)
            make.width.equalTo(2)
            make.centerX.equalTo(dateLabel.snp.centerX)
            make.bottom.equalTo(container.snp.bottom)
        }

        return container
    }
}

private class HiFootprintDashLineView: UIView {

    private let shapeLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(shapeLayer)
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [2, 2]
        shapeLayer.strokeColor = UIColor.color_HexStr("#d2e1ff").cgColor
        shapeLayer.fillColor = nil
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        let x = bounds.width / 2.0
        path.move(to: CGPoint(x: x, y: 0))
        path.addLine(to: CGPoint(x: x, y: bounds.height))
        shapeLayer.frame = bounds
        shapeLayer.path = path.cgPath
    }
}
