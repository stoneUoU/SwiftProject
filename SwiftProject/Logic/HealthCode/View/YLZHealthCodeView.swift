//
//  YLZHealthCodeView.swift
//  SwiftProject
//
//  Created by stone on 2021/9/26.
//

import UIKit

typealias YLZHealthCodeViewHandle = () -> Void

protocol YLZHealthCodeViewDelegate: AnyObject {
    func toOperate(view:YLZHealthCodeView)
}

class YLZHealthCodeView: UIView {
    var handle:YLZHealthCodeViewHandle?
    weak var healthCodeViewDelegate : YLZHealthCodeViewDelegate?
    /**
     * 0 : 绿码
     * 1 : 橙码
     * 2 : 红码
     */
    var clickNum:Int = 0;
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    //MARK: Public Method
    //MARK: Private Method
    //MARK: lazy load
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none;
        tableView.backgroundColor = YLZColorMZTBlueView;
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude));
        tableView.register(YLZHealthCodeInfoTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YLZHealthCodeInfoTableViewCell.self))
        tableView.register(YLZHealthCodeTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YLZHealthCodeTableViewCell.self))
        tableView.register(YLZHealthCodeCheckTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YLZHealthCodeCheckTableViewCell.self))
        tableView.register(YLZHealthCodeServiceTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YLZHealthCodeServiceTableViewCell.self))
        tableView.register(YLZHealthCodeSourceTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(YLZHealthCodeSourceTableViewCell.self))
        return tableView
    }()
    
    lazy var dataArrays:Array<Int> = {
        var dataArrays = Array<Int>();
        for i in 0 ..< 5 {
            dataArrays.append(i);
        }
        return dataArrays
    }()
}
    
//MARK: Public Method
extension YLZHealthCodeView {
    func setUI() {
        self.addSubview(self.tableView)
        self.setMas()
    }
    func setMas() {
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self);
        }
    }
}
 
//MARK: IB-Action
extension YLZHealthCodeView {
    
}
    
//MARK: Notice
extension YLZHealthCodeView {
    
}
    
//MARK: Delegate
extension YLZHealthCodeView:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArrays.count;
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZHealthCodeInfoTableViewCell.self)) as? YLZHealthCodeInfoTableViewCell
            if viewCell == nil {
                viewCell = YLZHealthCodeInfoTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(YLZHealthCodeInfoTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            viewCell!.handle =  {
                (_ clickNum:Int) -> Void in
                self.clickNum = clickNum;
                self.tableView.reloadData();
            }
            return viewCell!;
        } else if (indexPath.section == 1) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZHealthCodeTableViewCell.self)) as? YLZHealthCodeTableViewCell
            if viewCell == nil {
                viewCell = YLZHealthCodeTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(YLZHealthCodeTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            viewCell!.clickNum = self.clickNum;
            return viewCell!;
        } else if (indexPath.section == 2) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZHealthCodeCheckTableViewCell.self)) as? YLZHealthCodeCheckTableViewCell
            if viewCell == nil {
                viewCell = YLZHealthCodeCheckTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(YLZHealthCodeCheckTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        } else if (indexPath.section == 3) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZHealthCodeServiceTableViewCell.self)) as? YLZHealthCodeServiceTableViewCell
            if viewCell == nil {
                viewCell = YLZHealthCodeServiceTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(YLZHealthCodeServiceTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        } else {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZHealthCodeSourceTableViewCell.self)) as? YLZHealthCodeSourceTableViewCell
            if viewCell == nil {
                viewCell = YLZHealthCodeSourceTableViewCell(style: .default, reuseIdentifier: NSStringFromClass(YLZHealthCodeSourceTableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        return headerView
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (section == 0 || section == 1 || section == 2 || section == 3) {
            let footerView = UIView()
            return footerView
        } else {
            let footerView = YLZHealthCodeTableFooterView();
            return footerView;
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 0 || section == 1 || section == 2 || section == 3) {
            return 12;
        } else {
            return 54;
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 120;
        } else if (indexPath.section == 1) {
            return 467;
        } else if (indexPath.section == 2) {
            return 96;
        } else if (indexPath.section == 3) {
            return 308;
        } else {
            return 188;
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
