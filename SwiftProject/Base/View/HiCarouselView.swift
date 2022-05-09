//
//  HiCarouselView.swift
//  Hi-Kit-Module
//
//  Created by stone on 2022/5/6.
//

import Kingfisher

open class HiAutoModel:NSObject {
    public var image:String = ""
}

fileprivate class HiFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
    }
    convenience init(itemSize: CGSize) {
        self.init()
        minimumLineSpacing = 0.0
        minimumInteritemSpacing = 0.0
        self.itemSize = itemSize
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate class HiCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    convenience init(frame: CGRect, collectionViewLayout layout: HiFlowLayout, delegate: UICollectionViewDelegate?, dataSource: UICollectionViewDataSource?) {
        self.init(frame: frame, collectionViewLayout: layout)
        bounces = false
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        isPagingEnabled = true
        self.layer.contents = UIImage.init(named: "carousel_place_holder")?.cgImage
        self.contentMode = .scaleAspectFill;
        self.clipsToBounds = true;
        self.delegate = delegate
        self.dataSource = dataSource
    }
    
    fileprivate func scrollToItem(item: Int, section: Int, at: UICollectionView.ScrollPosition) {
        scrollToItem(at: IndexPath(item: item, section: section), at: at, animated: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Notification.Name {
    public struct HiTask {
        static let BecomeActive = Notification.Name("UIApplicationDidBecomeActiveNotification")
        static let Background = Notification.Name("UIApplicationDidEnterBackgroundNotification")
    }
}

fileprivate class HiCollectionViewCell: UICollectionViewCell {
    
    var subView: UIView? {
        didSet {
            guard let subView = subView else { return }
            self.contentView.addSubview(subView)
        }
    }
    
    public var autoModel: HiAutoModel? {
        didSet {
            guard let image = autoModel?.image else { return }
            let imageUrl = image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "";
            self.imageView.kf.setImage(with: URL(string: imageUrl), placeholder: UIImage.init(named: ""), options: nil, progressBlock: nil, completionHandler: nil);
        }
    }
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        imageView.isUserInteractionEnabled = true
        imageView.backgroundColor = .clear;
        imageView.contentMode = .scaleAspectFill;
        imageView.clipsToBounds = true;
        return imageView
    }()
    
    private static let reusedCellId = "HiCollectionViewCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.imageView)
        self.setMas();
    }
    
    func setMas() {
//        self.bottomImageView.snp.makeConstraints { (make) in
//            make.left.right.equalTo(self.imageView);
//            make.bottom.equalTo(self.imageView.snp.bottom);
//        }
    }
    
    static func itemViewWithCollectionView(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> HiCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reusedCellId, for: indexPath) as! HiCollectionViewCell
        return cell
    }
    
    static func registerCellWithCollectionView(_ collectionView: UICollectionView) {
        collectionView.register(HiCollectionViewCell.self, forCellWithReuseIdentifier: reusedCellId)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: 轮播类型视图是自定义 或者 默认 以及pageControl是系统样式还是自定义图片
public enum HiCarouselViewType {
    case `default`//默认
    case  custom //自定义
}

//MARK: dot在轮播图的位置 中心 左侧 右侧
public enum HiDotDirection {
    case `default`//默认
    case left // 左侧
    case right// 右侧
}

/*  自定义view的数组回调  */
public typealias AutoViewHandle = () -> [UIView]
/*  图片赋值回调  */
public typealias SetImageHandle = (UIImageView, String) -> Void
/*  点击事件的回调  */
public typealias DidSelectItemHandle = (Int) -> Void
/*  自动滚动到当前索引事件的回调  */
public typealias AutoDidSelectItemHandle = (Int) -> Void
/*  PageControl点击事件的回调  */
public typealias PageControlDidSelectIndexHandle = (Int) -> ()


open class HiCarouselView: UIView {
    
    /* -------------  公有方法  ---------------- */
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    public convenience init(frame: CGRect, dotLayout: HiDotLayout) {
        self.init(frame: frame)
        hiPageControl.dotLayout = dotLayout
        setupDotDiretion()
    }
    /*  图片赋值回调属性  */
    public var imageHandle: SetImageHandle?
    /*  点击事件的回调属性  */
    public var didSelectItemHandle: DidSelectItemHandle?
    /*  自动滚动到当前索引事件的属性  */
    public var autoDidSelectItemHandle: AutoDidSelectItemHandle?
    /*  PageControl点击事件的回调属性  */
    public var pageControlDidSelectIndexHandle: PageControlDidSelectIndexHandle?
    
    /* 设置自定义视图 */
    public var autoViewHandle: AutoViewHandle? {
        didSet {
            guard let autoViewHandle = autoViewHandle else { autoType = .default; return }
            autoType = .custom
            setupAutoViewHandle(autoViewHandle: autoViewHandle)
        }
    }
    /*如果是默认模式`default`  直接传入images数组即可*/
    public var autoModels: [HiAutoModel]? {
        didSet {
            setupImages(autoModels ?? [])
        }
    }
    
    /* 设置滚动时间间隔 */
    public var hi_timeInterval: TimeInterval = 2.0 {
        didSet {
            setupTimer()
        }
    }
    
    /* 是否自动轮播 */
    public var isAutoScroll: Bool = true {
        didSet {
            setupTimer()
        }
    }
    
    /* 设置轮播图的方向 */
    public var scrollDirection: UICollectionView.ScrollDirection = .horizontal {
        didSet {
            layout.scrollDirection = scrollDirection
        }
    }
    
    /* 设置pageControl的属性 */
    public var dotLayout: HiDotLayout = HiDotLayout() {
        didSet {
            hiPageControl.dotLayout = dotLayout
            setupDotDiretion()
        }
    }
    
    /* dot在轮播图的位置 中心 左侧 右侧 */
    public var dotDirection: HiDotDirection? {
        didSet {
            guard let dotDirection = dotDirection else { return }
            hiPageControl.dotDirection = dotDirection
        }
    }
    
    
    /* 是否隐藏pageControl，显示的情况下需要设置dotLayout 默认不设置也为隐藏 */
    public var isHiddenPageControl: Bool = false {
        didSet {
            if isHiddenPageControl {
                hiPageControl.isHidden = true
            }
        }
    }
    
    /* dot在轮播图的位置 左侧 或 右侧时，距离最屏幕最左边或最最右边的距离 */
    public var adjustValue: CGFloat = 0.0 {
        didSet {
            hiPageControl.adjustValue = adjustValue
        }
    }
    
    /* pageControl高度调整从而改变pageControl位置 */
    public var hiPageControlHeight: CGFloat = 20.0 {
        didSet {
            hiPageControl.frame.origin.y = bounds.height - hiPageControlHeight
            hiPageControl.frame.size.height = hiPageControlHeight
            hiPageControl.hiPageControlHeight = hiPageControlHeight
        }
    }
    
    /* 滚动手势禁用（文字轮播较实用）*/
    public var isDisableScrollGesture: Bool = false {
        didSet {
            guard let gestureRecognizers = collectionView.gestureRecognizers else { return }
            if isDisableScrollGesture {
                collectionView.canCancelContentTouches = false
                for gestrue in gestureRecognizers  {
                    if gestrue.isKind(of: UIPanGestureRecognizer.self) {
                        collectionView.removeGestureRecognizer(gestrue)
                    }
                }
            }
        }
    }
    
    /* -------------  以下私有方法  ---------------- */
    private var contentViews: [UIView] = []
    private var currentPageIndex: Int = 0
    private var timer: Timer?
    private var totalsCount: Int = 0
    private var autoType: HiCarouselViewType = .default
    
    private lazy var layout: HiFlowLayout = {
        let layout = HiFlowLayout(itemSize: CGSize(width: bounds.width, height: bounds.height))
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var hiPageControl: HiPageControlView = {
        let hiPageControl = HiPageControlView(frame: CGRect(x: 0, y: bounds.size.height - 20, width: bounds.size.width, height: 20))
        return hiPageControl
    }()
    
    private lazy var collectionView: HiCollectionView = {
        let collectionView = HiCollectionView(frame: bounds, collectionViewLayout: layout, delegate: self, dataSource: self)
        return collectionView
    }()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        destroyTimrer()
    }
}

extension HiCarouselView {
    
    private func setupImages(_ autoModel: [HiAutoModel]?)  {
        guard let autoModel = autoModel else { return }
        if autoType == .custom { return }
        autoModel.count == 1 ? destroyTimrer() : setupTimer()
        totalsCount = autoModel.count * 1024
        collectionView.reloadData()
        if scrollDirection == .vertical {
            collectionView.scrollToItem(item: totalsCount / 2, section: 0, at: .top)
        }else {
            collectionView.scrollToItem(item: totalsCount / 2, section: 0, at: .left)
        }
        setupPageControl()
    }
    
    private func setupAutoViewHandle(autoViewHandle: AutoViewHandle?) {
        guard let autoViewHandle = autoViewHandle else { return }
        if autoType == .default { return }
        contentViews.removeAll()
        contentViews = autoViewHandle()
        contentViews.count == 1 ? destroyTimrer() : setupTimer()
        totalsCount = contentViews.count * 1024
        collectionView.reloadData()
        if scrollDirection == .vertical {
            collectionView.scrollToItem(item: totalsCount / 2, section: 0, at: .top)
        }else {
            collectionView.scrollToItem(item: totalsCount / 2, section: 0, at: .left)
        }
        setupPageControl()
    }
    
    private func setupPageControl() {
        let numberOfPages = autoType == .default ? (self.autoModels?.count ?? 0) : contentViews.count
        numberOfPages == 1 ? (hiPageControl.isHidden = true) : (hiPageControl.isHidden = false)
        hiPageControl.numberOfPages = numberOfPages
        hiPageControl.currentDot = 0
        setupDotDiretion()
    }
    
    private func setupDotDiretion() {
        hiPageControl.dotDirection = dotDirection ?? .default
    }
}

extension HiCarouselView {
    private func setupSubViews() {
        HiCollectionViewCell.registerCellWithCollectionView(collectionView)
        addSubview(collectionView)
        addSubview(hiPageControl)
        registerNotification()
        setupTimer()
        setupPageControlDidSelect()
    }
    
    private func setupPageControlDidSelect() {
        hiPageControl.didSelectIndexHandle = {[weak self] index in
            guard let `self` = self else { return }
            let diffIndex = index - self.currentIndex() % ( self.autoType == .default ? (self.autoModels?.count ?? 1) : self.contentViews.count)
            if self.scrollDirection == .vertical {
                self.collectionView.scrollToItem(at: IndexPath(item: self.currentIndex() + diffIndex, section: 0), at: .top, animated: true)
            }else {
                self.collectionView.scrollToItem(at: IndexPath(item: self.currentIndex() + diffIndex, section: 0), at: .left, animated: true)
            }
            self.pageControlDidSelectIndexHandle?(index)
        }
    }
    
    private func registerNotification() {
        let noticenter = NotificationCenter.default
        noticenter.addObserver(self, selector: #selector(registerNoti(_:)), name: Notification.Name.HiTask.BecomeActive, object: nil)
        noticenter.addObserver(self, selector: #selector(registerNoti(_:)), name: Notification.Name.HiTask.Background, object: nil)
    }
    
    @objc private func registerNoti(_ notification: Notification) {
        if notification.name == Notification.Name.HiTask.BecomeActive {
            timer?.restart(hi_timeInterval)
        }else {
            timer?.pause()
        }
    }
}

extension HiCarouselView {
    private func setupTimer() {
        destroyTimrer()
        if !isAutoScroll {
            return
        }
        timer = Timer(timeInterval: hi_timeInterval, target: self, selector: #selector(timerUpdate(_:)), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    private func destroyTimrer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func timerUpdate(_ timer: Timer)  {
        if scrollDirection == .horizontal {
            let point = CGPoint(x: CGFloat(currentPageIndex + 1) * bounds.width, y: 0)
            collectionView.setContentOffset(point, animated: true)
        }else {
            let point = CGPoint(x: 0, y: CGFloat(currentPageIndex + 1) * bounds.height)
            collectionView.setContentOffset(point, animated: true)
        }
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview == nil {
            destroyTimrer()
        }
    }
}

extension Timer {
    func pause() {
        fireDate = Date.distantFuture
    }
    func restart(_ timeInterval: TimeInterval) {
        fireDate = Date() + timeInterval
    }
}

extension HiCarouselView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalsCount
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HiCollectionViewCell.itemViewWithCollectionView(collectionView, indexPath)
        guard let autoModel = self.autoModels else { return cell }
        let autoModelRender:HiAutoModel = autoModel[indexPath.item % (autoModel.count)];
        if autoType == .default {
//            guard let images = images else { return cell }
//            imageHandle?(cell.imageView, images[indexPath.item % (images.count)])
            cell.autoModel = autoModelRender;
        }else {
            for subView in cell.contentView.subviews { subView.removeFromSuperview() }
            cell.subView = contentViews[indexPath.item % contentViews.count]
        }
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if autoType == .default {
            guard let autoModel = self.autoModels else { return }
            didSelectItemHandle?(indexPath.item % (autoModel.count))
        }else {
            didSelectItemHandle?(indexPath.item % contentViews.count)
        }
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = currentIndex()
        if currentPageIndex != index {
            let realIndex = realItemIndex(index)
            hiPageControl.currentDot = realIndex
            autoDidSelectItemHandle?(realIndex)
        }
        currentPageIndex = index
    }
    
    private func realItemIndex(_ targetIndex: Int) -> Int {
        let contentCount = (autoType == .default ? (self.autoModels?.count ?? 1) : contentViews.count)
        return targetIndex % contentCount
    }
    
    private func currentIndex() -> Int {
        if layout.itemSize.width == 0 || layout.itemSize.height == 0 {
            return 0
        }
        var index = 0
        if scrollDirection == .horizontal {
            index = Int((collectionView.contentOffset.x + layout.itemSize.width * 0.5) / layout.itemSize.width)
        } else {
            index = Int((collectionView.contentOffset.y + layout.itemSize.height * 0.5) / layout.itemSize.height)
        }
        return max(0, index)
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        timer?.pause()
    }
    
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        timer?.restart(hi_timeInterval)
    }
    
    private func item(_ scrollView: UIScrollView) -> IndexPath? {
        return collectionView.indexPathForItem(at: scrollView.contentOffset)
    }
    
}

private let isPostDotSize: CGFloat = 14.999099
public class HiDotLayout: NSObject {
    /* dot单独的一个的宽度 */
    public var dotWidth: CGFloat = isPostDotSize
    /* dot单独的一个的高度 */
    public var dotHeight: CGFloat = isPostDotSize
    /* dot之间的间距 */
    public var dotMargin: CGFloat = 15.0
    /* dot未选中的图片 */
    public var dotImage: UIImage?
    /* dot选中后的图片 */
    public var dotSelectImage: UIImage?
    /* dot未选中的颜色 */
    public var dotColor: UIColor = UIColor.clear
    /* dot选中的后颜色 */
    public var dotSelectColor: UIColor = UIColor.clear
    /* custom为默认是自定义 ， 想使用类似系统样式传入default */
    public var dotType: HiCarouselViewType = .custom
    /* 滚动过程是否放大当前dot */
    public var isScale: Bool = true
    /* 滚动过程dot放大倍率 */
    public var scaleXY: CGFloat = 1.4
    public override init() { super.init() }
    public convenience init(dotWidth: CGFloat = 14.999099, dotHeight: CGFloat = 14.999099, dotMargin: CGFloat = 15.0, dotImage: UIImage? = nil, dotSelectImage: UIImage? = nil, dotColor: UIColor = UIColor.clear, dotSelectColor: UIColor = UIColor.clear, dotType: HiCarouselViewType = .custom, isScale: Bool = true, scaleXY: CGFloat = 1.4) {
        self.init()
        self.dotWidth = dotWidth
        self.dotHeight = dotHeight
        self.dotMargin = dotMargin
        self.dotImage = dotImage
        self.dotSelectImage = dotSelectImage
        self.dotColor = dotColor
        self.dotSelectColor = dotSelectColor
        self.dotType = dotType
        self.isScale = isScale
        self.scaleXY = scaleXY
    }
}

fileprivate class HiPageControlView: UIView {
    
    fileprivate var didSelectIndexHandle: PageControlDidSelectIndexHandle?
    
    fileprivate var dotDirection: HiDotDirection = .default {
        didSet {
            switch dotDirection {
            case .left:
                frame.origin.x = adjustValue
                break
            case .right:
                let parentViewW = self.superview?.bounds.width ?? UIScreen.main.bounds.width
                frame.origin.x = parentViewW - totalWidth - adjustValue
                break
            default:
                let parentViewW = self.superview?.bounds.width ?? UIScreen.main.bounds.width
                frame.origin.x = (parentViewW - totalWidth) / 2.0
            }
        }
    }
    
    fileprivate var adjustValue: CGFloat = 0.0 {
        didSet {
            setupSubViews()
        }
    }
    
    fileprivate var hiPageControlHeight: CGFloat = 20.0 {
        didSet {
            setupSubViews()
        }
    }
    
    private var totalWidth: CGFloat = 0
    
    fileprivate var numberOfPages: Int = 0 {
        didSet {
            setupSubViews()
        }
    }
    
    fileprivate var currentDot: Int = 0 {
        willSet {
            guard newValue != currentDot else { return }
            hi_dissmissAnimation(currentIndex: currentDot, isScale: dotLayout.isScale)
            hi_showAnimation(willIndex: newValue, isScale: dotLayout.isScale)
        }
    }
    
    fileprivate var dotLayout: HiDotLayout = HiDotLayout() {
        didSet {
            setupSubViews()
        }
    }
    
    fileprivate convenience init(frame: CGRect, layout: HiDotLayout) {
        self.init(frame: frame)
        setupSubViews()
    }
    
    private var dotViews: [UIImageView] = []
    
    private func setupSubViews() {
        hi_resetAllSubViews()
        hi_layoutSubViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HiPageControlView {
    
    private func hi_layoutSubViews() {
        totalWidth = 0.0
        for index in 0 ..< numberOfPages {
            let dotView = UIImageView()
            hi_autoSizeImage(dotView: dotView, index: index)
            if index == numberOfPages - 1 {
                totalWidth = dotView.frame.origin.x + dotView.frame.size.width
            }
            dotView.tag = index + 200
            hi_createGesture(dotView: dotView)
            addSubview(dotView)
            dotViews.append(dotView)
            bounds.size.width = totalWidth
        }
    }
    
    private func hi_resetAllSubViews() {
        for view in subviews { view.removeFromSuperview() }
        dotViews.removeAll()
    }
    
}

extension HiPageControlView {
    
    private func hi_autoSizeImage(dotView: UIImageView, index: Int) {
        if index == 0 {
            dotView.backgroundColor = dotLayout.dotSelectColor
            dotView.image = dotLayout.dotSelectImage
            hi_dotImage(dotLayout.dotSelectImage, dotView: dotView, index: index)
        }else {
            dotView.backgroundColor = dotLayout.dotColor
            dotView.image = dotLayout.dotImage
            hi_dotImage(dotLayout.dotImage, dotView: dotView, index: index)
        }
    }
    
    private func hi_dotImage(_ dotImage: UIImage?, dotView: UIImageView, index: Int) {
        if dotLayout.dotType == .default {
            dotView.frame = CGRect(x: (dotLayout.dotWidth + dotLayout.dotMargin) * CGFloat(index), y: (bounds.height - dotLayout.dotWidth) / 2.0, width: dotLayout.dotWidth, height: dotLayout.dotWidth)
            dotView.layer.cornerRadius = dotLayout.dotWidth / 2.0
            dotView.layer.masksToBounds = true
            dotView.clipsToBounds = true
            return
        }
        var imageW = dotImage?.size.width ?? dotLayout.dotWidth
        var imageH = dotImage?.size.height ?? dotLayout.dotHeight
        if dotLayout.dotWidth != isPostDotSize {
            imageW = dotLayout.dotWidth
        }
        if dotLayout.dotHeight != isPostDotSize {
            imageH = dotLayout.dotHeight
        }
        dotView.frame = CGRect(x: (imageW + dotLayout.dotMargin) * CGFloat(index), y: (bounds.height - imageH) / 2.0, width: imageW, height: imageH)
    }
    
    private func hi_createGesture(dotView: UIImageView) {
        dotView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(hi_tapGesture(_:)))
        dotView.addGestureRecognizer(tap)
    }
    
    @objc private func hi_tapGesture(_ tap: UITapGestureRecognizer) {
        guard let dotView = tap.view else { return }
        let index = dotView.tag - 200
        didSelectIndexHandle?(index)
    }
    
    private func hi_showAnimation(willIndex: Int, isScale: Bool) {
        if (self.dotViews.count == 0) {
            return;
        }
        let dotView = self.dotViews[willIndex]
        if isScale {
            UIView.animate(withDuration: 0.34 * 3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: -24, options: [.curveEaseInOut, .curveLinear], animations: {
                dotView.backgroundColor = self.dotLayout.dotSelectColor
                dotView.image = self.dotLayout.dotSelectImage
                dotView.transform = CGAffineTransform(scaleX: self.dotLayout.scaleXY, y: self.dotLayout.scaleXY)
            }) { (_) in }
        }else {
            dotView.backgroundColor = self.dotLayout.dotSelectColor
            dotView.image = self.dotLayout.dotSelectImage
        }
    }
    
    private func hi_dissmissAnimation(currentIndex: Int, isScale: Bool) {
        if (self.dotViews.count == 0) {
            return;
        }
        let dotView = self.dotViews[currentIndex]
        if isScale {
            UIView.animate(withDuration: 0.5, animations: {
                dotView.backgroundColor = self.dotLayout.dotColor
                dotView.image = self.dotLayout.dotImage
                dotView.transform = CGAffineTransform.identity
            })
        }else {
            dotView.backgroundColor = self.dotLayout.dotColor
            dotView.image = self.dotLayout.dotImage
        }
    }
    
}
