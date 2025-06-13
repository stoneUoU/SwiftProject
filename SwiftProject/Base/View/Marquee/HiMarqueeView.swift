//
//  HiMarqueeView.swift
//  Hi-Kit-Module
//
//  Created by stone on 2022/5/6.
//

import UIKit

@objc public protocol HiMarqueeViewDataSource : NSObjectProtocol {
    func numberOfRowsFor(roolingView: HiMarqueeView) -> Int
    func rollingNoticeView(roolingView: HiMarqueeView, cellAtIndex index: Int) -> HiMarqueeViewCell
}

@objc public protocol HiMarqueeViewDelegate: NSObjectProtocol {
    @objc optional func rollingNoticeView(_ roolingView: HiMarqueeView, didClickAt index: Int)
}


open class HiMarqueeView: UIView {
    weak open var dataSource : HiMarqueeViewDataSource?
    weak open var delegate : HiMarqueeViewDelegate?
    open var stayInterval = 3.0
    open private(set) var currentIndex = 0
    
    // MARK: private properties
    private lazy var cellClsDict: Dictionary = { () -> [String : Any] in
        var tempDict = Dictionary<String, Any>()
        return tempDict
    }()
    private lazy var reuseCells: Array = { () -> [HiMarqueeViewCell] in
        var tempArr = Array<HiMarqueeViewCell>()
        return tempArr
    }()
    
    private var timer: Timer?
    private var currentCell: HiMarqueeViewCell?
    private var willShowCell: HiMarqueeViewCell?
    private var isAnimating = false
    
    // MARK: -
    open func register(_ cellClass: Swift.AnyClass?, forCellReuseIdentifier identifier: String) {
        self.cellClsDict[identifier] = cellClass
    }
    
    open func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        self.cellClsDict[identifier] = nib
    }
    
    open func dequeueReusableCell(withIdentifier identifier: String) -> HiMarqueeViewCell? {
        for cell in self.reuseCells {
            guard let reuseIdentifier = cell.reuseIdentifier else { return nil }
            if reuseIdentifier.elementsEqual(identifier) {
                return cell
            }
        }
        
        if let cellCls = self.cellClsDict[identifier] {
            if let nib = cellCls as? UINib {
                let arr = nib.instantiate(withOwner: nil, options: nil)
                if let cell = arr.first as? HiMarqueeViewCell {
                    cell.setValue(identifier, forKeyPath: "reuseIdentifier")
                    return cell
                }
                return nil
            }
            
            if let noticeCellCls = cellCls as? HiMarqueeViewCell.Type {
                let cell = noticeCellCls.self.init(reuseIdentifier: identifier)
                return cell
            }
            
        }
        return nil
    }
    
    open func reloadDataAndStartRoll() {
        stopRoll()
        layoutCurrentCellAndWillShowCell()
        
        guard let count = self.dataSource?.numberOfRowsFor(roolingView: self) else {
            return
        }
        
        guard count >= 2 else {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: stayInterval, target: self, selector: #selector(HiMarqueeView.timerHandle), userInfo: nil, repeats: true)
        if let __timer = timer {
            RunLoop.current.add(__timer, forMode: RunLoop.Mode.common)
        }
        
    }
    
    // 如果想要释放，请在合适的地方停止timer。 If you want to release, please stop the timer in the right place,for example '-viewDidDismiss'
    open func stopRoll() {
        
        if let rollTimer = timer {
            rollTimer.invalidate()
            timer = nil
        }
        
        isAnimating = false
        currentIndex = 0
        currentCell?.removeFromSuperview()
        willShowCell?.removeFromSuperview()
        currentCell = nil
        willShowCell = nil
        self.reuseCells.removeAll()
    }
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNoticeViews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNoticeViews()
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
}

// MARK: private funcs
extension HiMarqueeView {
    
    @objc fileprivate func timerHandle() {
        if isAnimating {
            return
        }
        layoutCurrentCellAndWillShowCell()
        currentIndex += 1
        
        let w = self.frame.size.width
        let h = self.frame.size.height
        
        isAnimating = true
        UIView.animate(withDuration: 0.5, animations: {
            self.currentCell?.frame = CGRect(x: 0, y: -h, width: w, height: h)
            self.willShowCell?.frame = CGRect(x: 0, y: 0, width: w, height: h)
        }) { (flag) in
            if let cell0 = self.currentCell, let cell1 = self.willShowCell {
                self.reuseCells.append(cell0)
                cell0.removeFromSuperview()
                self.currentCell = cell1
            }
            self.isAnimating = false
        }
    }
    
    
    fileprivate func layoutCurrentCellAndWillShowCell() {
        guard let count = (self.dataSource?.numberOfRowsFor(roolingView: self)) else { return }
        
        if (currentIndex > count - 1) {
            currentIndex = 0
        }
        
        var willShowIndex = currentIndex + 1
        if (willShowIndex > count - 1) {
            willShowIndex = 0
        }
        //    print(">>>>%d", currentIndex)
        
        let w = self.frame.size.width
        let h = self.frame.size.height
        
        //        print("count: \(count),  currentIndex:\(currentIndex)  willShowIndex: \(willShowIndex)")
        
        if currentCell == nil {
            // 第一次没有currentcell
            // currentcell is null at first time
            if let cell = self.dataSource?.rollingNoticeView(roolingView: self, cellAtIndex: currentIndex) {
                currentCell = cell
                cell.frame  = CGRect(x: 0, y: 0, width: w, height: h)
                self.addSubview(cell)
            }
            
            return
        }
        
        
        if let cell = self.dataSource?.rollingNoticeView(roolingView: self, cellAtIndex: willShowIndex) {
            willShowCell = cell
            cell.frame = CGRect(x: 0, y: h, width: w, height: h)
            self.addSubview(cell)
        }
        
        
        
        guard let _cCell = currentCell, let _wCell = willShowCell else {
            return
        }
        
        let currentCellIdx = self.reuseCells.firstIndex(of: _cCell)
        let willShowCellIdx = self.reuseCells.firstIndex(of: _wCell)
        
        if let index = currentCellIdx {
            self.reuseCells.remove(at: index)
        }
        
        if let index = willShowCellIdx {
            self.reuseCells.remove(at: index)
        }
        
    }
    
    @objc fileprivate func handleCellTapAction(){
        guard let count = self.dataSource?.numberOfRowsFor(roolingView: self) else {
            return
        }
        
        if (currentIndex > count - 1) {
            currentIndex = 0;
        }
        self.delegate?.rollingNoticeView?(self, didClickAt: currentIndex)
    }
    
    fileprivate func setupNoticeViews() {
        self.clipsToBounds = true
        self.addGestureRecognizer(self.createTapGesture())
    }
    
    fileprivate func createTapGesture() -> UITapGestureRecognizer {
        return UITapGestureRecognizer(target: self, action: #selector(HiMarqueeView.handleCellTapAction))
    }
}

