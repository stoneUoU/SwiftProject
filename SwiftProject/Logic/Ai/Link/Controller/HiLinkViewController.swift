//
//  TableViewController.swift
//  Linkage
//
//  Created by LeeJay on 2017/3/3.
//  Copyright © 2017年 LeeJay. All rights reserved.
//

import UIKit

class HiLinkViewController: HiBaseViewController, UITableViewDataSource, UITableViewDelegate {

    fileprivate lazy var leftTableView : UITableView = {
        let leftTableView = UITableView()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        leftTableView.frame = CGRect(x: 0, y: HiStatusBarAndNavigationBarH, width: 80, height: HiSCREENHEIGHT-(HiStatusBarAndNavigationBarH+HiTabbarSafeBotM))
        leftTableView.rowHeight = 55
        leftTableView.showsVerticalScrollIndicator = false
        leftTableView.separatorColor = UIColor.clear
        leftTableView.register(HiLinkLeftTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HiLinkLeftTableViewCell.self))
        leftTableView.contentInset = .zero
        if #available(iOS 15.0, *) {
            leftTableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }  // iOS 15+
        leftTableView.contentInsetAdjustmentBehavior = .never;
        return leftTableView
    }()
    
    fileprivate lazy var rightTableView : UITableView = {
        let rightTableView = UITableView()
        rightTableView.delegate = self
        rightTableView.dataSource = self
        rightTableView.frame = CGRect(x: 80, y: HiStatusBarAndNavigationBarH, width: HiSCREENWIDTH - 80, height: HiSCREENHEIGHT-(HiStatusBarAndNavigationBarH+HiTabbarSafeBotM))
        rightTableView.rowHeight = 96
        rightTableView.showsVerticalScrollIndicator = false
        rightTableView.register(HiLinkRightTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(HiLinkRightTableViewCell.self))
        rightTableView.contentInset = .zero
        if #available(iOS 15.0, *) {
            rightTableView.sectionHeaderTopPadding = 0
        } else {
            // Fallback on earlier versions
        }  // iOS 15+
        rightTableView.contentInsetAdjustmentBehavior = .never;
        return rightTableView
    }()
    
    fileprivate lazy var categoryDatas = HiCategoryModel();
    
    fileprivate var selectIndex = 0
    fileprivate var isScrollDown = true
    fileprivate var lastOffsetY : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI();
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setUI() {
        self.view.backgroundColor = .white;
        self.setStatusAndNavigationCloseIconUI(centerLabelTitle: "视图联动", rightButtonTitle: "",ifWhiteIMV:false,navigationColor:.white,centerLabelColor:.black,ifLine: true);
       
        view.addSubview(leftTableView)
        view.addSubview(rightTableView)
        self.configureData { boolean in
            self.leftTableView.reloadData();
            self.rightTableView.reloadData();
        }
        leftTableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: .none)
        
    }
}

//MARK: - 获取数据
extension HiLinkViewController {
    
    fileprivate func configureData(callback: (_ boolean:Bool)->()) {
        guard let path = Bundle.main.path(forResource: "meituan", ofType: "json") else { return }
        
        guard let data = NSData(contentsOfFile: path) as Data? else { return }
        
        guard let anyObject = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return }
        
        guard let dict = anyObject as? [String : Any] else { return }
        
        guard let datas = dict["data"] as? [String : Any] else { return }
        
        if let handyJSON:HiCategoryModel = HiCategoryModel.deserialize(from: datas) {
            self.categoryDatas = handyJSON;
        }
        callback(true);
    }
    
}

//MARK: - TableView DataSource Delegate
extension HiLinkViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if leftTableView == tableView {
            return 1
        } else {
            return self.categoryDatas.food_spu_tags.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if leftTableView == tableView {
            return self.categoryDatas.food_spu_tags.count
        } else {
            return self.categoryDatas.food_spu_tags[section].spus.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if leftTableView == tableView {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiLinkLeftTableViewCell.self)) as? HiLinkLeftTableViewCell
            if viewCell == nil {
                viewCell = HiLinkLeftTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(HiLinkLeftTableViewCell.self))
            }
            let model = self.categoryDatas.food_spu_tags[indexPath.row]
            viewCell!.tagModel = model;
            return viewCell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(HiLinkRightTableViewCell.self), for: indexPath) as! HiLinkRightTableViewCell
            let model = self.categoryDatas.food_spu_tags[indexPath.section].spus[indexPath.row]
            cell.tagModel = model;
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if leftTableView == tableView {
            return 0
        }
//        return 20
        return 0.0001
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if leftTableView == tableView {
            return nil
        }
//        let headerView = HiLinkTableViewHeaderView(frame: CGRect(x: 0, y: 0, width: HiSCREENWIDTH, height: 20))
//        let model = self.categoryDatas.food_spu_tags[section]
//        headerView.nameLabel.text = model.name
//        return headerView
        let headerView = UIView();
        headerView.backgroundColor = UIColor.red
        return headerView
    }
    
    // TableView 分区标题即将展示
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // 当前的 tableView 是 RightTableView，RightTableView 滚动的方向向上，RightTableView 是用户拖拽而产生滚动的（（主要判断 RightTableView 用户拖拽而滚动的，还是点击 LeftTableView 而滚动的）
        if (rightTableView == tableView)
            && !isScrollDown
            && (rightTableView.isDragging || rightTableView.isDecelerating) {
            selectRow(index: section)
        }
    }
    
    // TableView分区标题展示结束
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        // 当前的 tableView 是 RightTableView，RightTableView 滚动的方向向下，RightTableView 是用户拖拽而产生滚动的（（主要判断 RightTableView 用户拖拽而滚动的，还是点击 LeftTableView 而滚动的）
        if (rightTableView == tableView)
            && isScrollDown
            && (rightTableView.isDragging || rightTableView.isDecelerating) {
            selectRow(index: section + 1)
        }
    }
    
    // 当拖动右边 TableView 的时候，处理左边 TableView
    private func selectRow(index : Int) {
        leftTableView.selectRow(at: IndexPath(row: index, section: 0), animated: true, scrollPosition: .top)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if leftTableView == tableView {
            selectIndex = indexPath.row
            rightTableView.scrollToRow(at: IndexPath(row: 0, section: selectIndex), at: .top, animated: true)
            leftTableView.scrollToRow(at: IndexPath(row: selectIndex, section: 0), at: .top, animated: true)
        }
    }
    
    // 标记一下 RightTableView 的滚动方向，是向上还是向下
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let tableView = scrollView as! UITableView
        if rightTableView == tableView {
            isScrollDown = lastOffsetY < scrollView.contentOffset.y
            lastOffsetY = scrollView.contentOffset.y
        }
    }
}
