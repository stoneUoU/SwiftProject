//
//  HiMyFooterViewController.swift
//  SwiftProject
//
//  Created by stone on 2025/12/29.
//

import UIKit
import SnapKit

private let HiFootprintBlueColor = UIColor.color_HexStr("#4077F4")

struct HiFootprintItem {
    let title: String
    let backgroundColor: UIColor
    let iconName: String
}

class HiMyFooterViewController: HiBaseViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var isCalendarExpanded = false
    var calendarHeightConstraint: Constraint?

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = YLZColorBackGround
        return scrollView
    }()

    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = YLZColorBackGround
        return view
    }()

    lazy var tabContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var serviceButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("服务", for: .normal)
        button.titleLabel?.font = YLZFont.medium(size: 16)
        button.setTitleColor(HiFootprintBlueColor, for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()

    lazy var infoButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("资讯", for: .normal)
        button.titleLabel?.font = YLZFont.regular(size: 16)
        button.setTitleColor(YLZColorTitleTwo, for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()

    lazy var policyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("政策", for: .normal)
        button.titleLabel?.font = YLZFont.regular(size: 16)
        button.setTitleColor(YLZColorTitleTwo, for: .normal)
        button.isUserInteractionEnabled = false
        return button
    }()

    lazy var tabIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = HiFootprintBlueColor
        view.layer.cornerRadius = 1
        view.layer.masksToBounds = true
        return view
    }()

    lazy var calendarContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    lazy var calendarView: HiFootprintCalendarView = {
        let view = HiFootprintCalendarView()
        return view
    }()

    lazy var calendarSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = YLZColorSeparator
        return view
    }()

    lazy var footprintTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "足迹"
        label.textColor = YLZColorTitleOne
        label.font = YLZFont.medium(size: 16)
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
        view.backgroundColor = YLZColorBackGround
        setStatusAndNavigationUI(centerLabelTitle: "我的足迹",
                                 rightButtonTitle: "",
                                 ifWhiteIMV: true,
                                 navigationColor: HiFootprintBlueColor,
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
        contentView.addSubview(tabContainerView)
        tabContainerView.addSubview(serviceButton)
        tabContainerView.addSubview(infoButton)
        tabContainerView.addSubview(policyButton)
        tabContainerView.addSubview(tabIndicatorView)

        contentView.addSubview(calendarContainerView)
        calendarContainerView.addSubview(calendarView)
        calendarContainerView.addSubview(calendarSeparatorView)

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

        tabContainerView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(44)
        }

        serviceButton.snp.makeConstraints { make in
            make.centerY.equalTo(tabContainerView)
            make.left.equalTo(tabContainerView).offset(32)
        }

        policyButton.snp.makeConstraints { make in
            make.centerY.equalTo(tabContainerView)
            make.right.equalTo(tabContainerView).offset(-32)
        }

        infoButton.snp.makeConstraints { make in
            make.centerY.equalTo(tabContainerView)
            make.centerX.equalTo(tabContainerView)
        }

        tabIndicatorView.snp.makeConstraints { make in
            make.bottom.equalTo(tabContainerView.snp.bottom)
            make.centerX.equalTo(serviceButton.snp.centerX)
            make.width.equalTo(32)
            make.height.equalTo(2)
        }

        calendarContainerView.snp.makeConstraints { make in
            make.top.equalTo(tabContainerView.snp.bottom)
            make.left.right.equalTo(contentView)
        }

        calendarView.snp.makeConstraints { make in
            make.top.equalTo(calendarContainerView).offset(4)
            make.left.equalTo(calendarContainerView).offset(16)
            make.right.equalTo(calendarContainerView).offset(-16)
            self.calendarHeightConstraint = make.height.equalTo(72).constraint
        }

        calendarSeparatorView.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom).offset(8)
            make.left.right.equalTo(calendarContainerView)
            make.height.equalTo(1)
            make.bottom.equalTo(calendarContainerView)
        }

        footprintTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(calendarContainerView.snp.bottom).offset(16)
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

        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleCalendar))
        calendarContainerView.addGestureRecognizer(tap)
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

    @objc func toggleCalendar() {
        isCalendarExpanded.toggle()
        calendarView.setExpanded(isCalendarExpanded)
        let targetHeight = calendarView.requiredHeight
        calendarHeightConstraint?.update(offset: targetHeight)
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }

    func createTimelineSectionView(dateText: String, items: [HiFootprintItem]) -> UIView {
        let container = UIView()

        let dateLabel = UILabel()
        dateLabel.text = dateText
        dateLabel.textAlignment = .center
        dateLabel.textColor = .white
        dateLabel.font = YLZFont.medium(size: 12)
        dateLabel.backgroundColor = HiFootprintBlueColor
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
            titleLabel.textColor = YLZColorTitleOne
            titleLabel.font = YLZFont.regular(size: 14)

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

private class HiFootprintCalendarCell: UICollectionViewCell {

    let weekLabel = UILabel()
    let dayCircleView = UIView()
    let dayLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        weekLabel.font = YLZFont.regular(size: 12)
        weekLabel.textColor = YLZColorTitleThree
        weekLabel.textAlignment = .center

        dayCircleView.layer.cornerRadius = 16
        dayCircleView.layer.masksToBounds = true

        dayLabel.font = YLZFont.medium(size: 16)
        dayLabel.textAlignment = .center

        contentView.addSubview(weekLabel)
        contentView.addSubview(dayCircleView)
        dayCircleView.addSubview(dayLabel)

        weekLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(4)
            make.centerX.equalTo(contentView)
        }

        dayCircleView.snp.makeConstraints { make in
            make.top.equalTo(weekLabel.snp.bottom).offset(8)
            make.centerX.equalTo(contentView)
            make.width.height.equalTo(32)
            make.bottom.lessThanOrEqualTo(contentView).offset(-4)
        }

        dayLabel.snp.makeConstraints { make in
            make.edges.equalTo(dayCircleView)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(weekText: String, dayText: String, isToday: Bool, isCurrentMonth: Bool, showWeek: Bool) {
        weekLabel.text = showWeek ? weekText : ""
        weekLabel.isHidden = !showWeek
        dayLabel.text = dayText
        if isToday {
            dayCircleView.backgroundColor = HiFootprintBlueColor
            dayLabel.textColor = .white
        } else {
            dayCircleView.backgroundColor = .clear
            dayLabel.textColor = isCurrentMonth ? YLZColorTitleOne : YLZColorTitleThree
        }
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

class HiFootprintCalendarView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private enum DisplayMode {
        case week
        case month
    }

    private let collectionView: UICollectionView
    private let calendar = Calendar.current
    private var days: [Date?] = []
    private let weekdaySymbols = ["日", "一", "二", "三", "四", "五", "六"]
    private let weekRowHeight: CGFloat = 72
    private let monthRowHeight: CGFloat = 72
    private var displayMode: DisplayMode = .week

    override init(frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)

        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HiFootprintCalendarCell.self, forCellWithReuseIdentifier: "HiFootprintCalendarCell")

        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        reloadDataForCurrentMode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func generateCurrentWeek() {
        let today = Date()
        let startOfToday = calendar.startOfDay(for: today)
        let weekday = calendar.component(.weekday, from: startOfToday)
        let weekdayIndex = weekday - 1
        guard let sunday = calendar.date(byAdding: .day, value: -weekdayIndex, to: startOfToday) else {
            return
        }
        days = (0..<7).compactMap { offset in
            calendar.date(byAdding: .day, value: offset, to: sunday)
        }
    }

    private func generateCurrentMonth() {
        let today = Date()
        let comps = calendar.dateComponents([.year, .month], from: today)
        guard let firstOfMonth = calendar.date(from: comps),
              let range = calendar.range(of: .day, in: .month, for: firstOfMonth) else {
            return
        }
        let firstWeekday = calendar.component(.weekday, from: firstOfMonth)
        let weekdayIndex = firstWeekday - 1
        let leadingEmpty = weekdayIndex
        let totalDays = range.count
        let totalCells = ((leadingEmpty + totalDays + 6) / 7) * 7
        guard let startDate = calendar.date(byAdding: .day, value: -leadingEmpty, to: firstOfMonth) else {
            return
        }
        var temp: [Date?] = []
        for offset in 0..<totalCells {
            temp.append(calendar.date(byAdding: .day, value: offset, to: startDate))
        }
        days = temp
    }

    private func reloadDataForCurrentMode() {
        switch displayMode {
        case .week:
            generateCurrentWeek()
        case .month:
            generateCurrentMonth()
        }
        collectionView.reloadData()
    }

    func setExpanded(_ expanded: Bool) {
        displayMode = expanded ? .month : .week
        reloadDataForCurrentMode()
    }

    var requiredHeight: CGFloat {
        let count = max(1, days.count)
        let rows = max(1, Int(ceil(Double(count) / 7.0)))
        if displayMode == .week {
            return weekRowHeight
        } else {
            return CGFloat(rows) * monthRowHeight
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return days.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HiFootprintCalendarCell", for: indexPath) as? HiFootprintCalendarCell else {
            return UICollectionViewCell()
        }
        let date = days[indexPath.item]
        let weekText = weekdaySymbols[indexPath.item % weekdaySymbols.count]
        let row = indexPath.item / 7
        let showWeek: Bool
        if displayMode == .week {
            showWeek = true
        } else {
            showWeek = (row == 0)
        }
        if let realDate = date {
            let day = calendar.component(.day, from: realDate)
            let isToday = calendar.isDate(realDate, inSameDayAs: Date())
            let isCurrentMonth = calendar.isDate(realDate, equalTo: Date(), toGranularity: .month)
            cell.configure(weekText: weekText,
                           dayText: "\(day)",
                           isToday: isToday,
                           isCurrentMonth: isCurrentMonth,
                           showWeek: showWeek)
        } else {
            cell.configure(weekText: weekText,
                           dayText: "",
                           isToday: false,
                           isCurrentMonth: false,
                           showWeek: showWeek)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 7.0
        if displayMode == .week {
            return CGSize(width: width, height: weekRowHeight)
        } else {
            return CGSize(width: width, height: monthRowHeight)
        }
    }
}
