//
//  YLZRouteCodeView.swift
//  SwiftProject
//
//  Created by stone on 2022/4/25.
//

import UIKit

typealias YLZRouteCodeViewHandle = () -> Void

protocol YLZRouteCodeViewDelegate: AnyObject {
    func toOperate(view:YLZRouteCodeView)
}

class YLZRouteCodeView: UIView {
    var handle:YLZRouteCodeViewHandle?
    weak var routeCodeViewDelegate : YLZRouteCodeViewDelegate?
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
        tableView.backgroundColor = YLZColorRouteCode;
        tableView.tableHeaderView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude));
        tableView.register(YLZRouteCodeCell.self, forCellReuseIdentifier: NSStringFromClass(YLZRouteCodeCell.self))
        tableView.register(YLZRouteCodeRecordCell.self, forCellReuseIdentifier: NSStringFromClass(YLZRouteCodeRecordCell.self))
        tableView.register(YLZRouteCodeInfoCell.self, forCellReuseIdentifier: NSStringFromClass(YLZRouteCodeInfoCell.self))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell.self))
        return tableView
    }()
    
    lazy var dataArrays:Array<Array<AnyObject>> = {
        var dataArrays = Array<Array<AnyObject>>();
        for i in 0 ..< 4 {
            if (i == 0 || i == 1) {
                dataArrays.append([]);
            } else if (i == 2) {
                var funcModels:Array<AnyObject> = Array<AnyObject>();
                for j in 0 ..< 7 {
                    let funcModel = YLZFunctionModel();
                    if (j == 0) {
                        funcModel.iconName = "ylz_error_phone";
                        funcModel.functionName = "有异常要打电话";
                        funcModel.topFillet = true;
                    } else if (j == 1) {
                        funcModel.iconName = "ylz_personal_info_setting";
                        funcModel.functionName = "个人信息设置";
                    } else if (j == 2) {
                        funcModel.iconName = "ylz_add_or_delete";
                        funcModel.functionName = "添加和删除亲友健康码";
                    } else if (j == 3) {
                        funcModel.iconName = "ylz_questions";
                        funcModel.functionName = "有疑问想得到解答";
                    } else if (j == 4) {
                        funcModel.iconName = "ylz_download_love_card";
                        funcModel.functionName = "下载福码爱心卡";
                    } else if (j == 5) {
                        funcModel.iconName = "ylz_manage_code";
                        funcModel.functionName = "管理张贴码";
                    } else if (j == 6) {
                        funcModel.iconName = "ylz_add_desktop";
                        funcModel.functionName = "添加健康码到桌面";
                        funcModel.bottomFillet = true;
                    }
                    funcModels.append(funcModel);
                }
                dataArrays.append(funcModels);
            } else {
                var funcModels:Array<AnyObject> = Array<AnyObject>();
                for j in 0 ..< 4 {
                    let funcModel = YLZFunctionModel();
                    if (j == 0) {
                        funcModel.iconName = "ylz_detect_map";
                        funcModel.functionName = "核酸检测地图";
                        funcModel.topFillet = true;
                    } else if (j == 1) {
                        funcModel.iconName = "ylz_yimiao_pre";
                        funcModel.functionName = "疫苗接种预约";
                    } else if (j == 2) {
                        funcModel.iconName = "ylz_yimiao_map";
                        funcModel.functionName = "疫苗接种地图";
                    } else {
                        funcModel.iconName = "ylz_elec_code";
                        funcModel.functionName = "医保电子凭证";
                        funcModel.bottomFillet = true;
                    }
                    funcModels.append(funcModel);
                }
                dataArrays.append(funcModels);
            }
        }
        return dataArrays
    }()
}
    
//MARK: Public Method
extension YLZRouteCodeView {
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
extension YLZRouteCodeView {
    
}
    
//MARK: Notice
extension YLZRouteCodeView {
    
}
    
//MARK: Delegate
extension YLZRouteCodeView:UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArrays.count;
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let funcModels:Array<AnyObject> = self.dataArrays[section];
        if (section == 0 || section == 1) {
            return 1
        } else {
            return funcModels.count;
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZRouteCodeCell.self)) as? YLZRouteCodeCell
            if viewCell == nil {
                viewCell = YLZRouteCodeCell(style: .default, reuseIdentifier: NSStringFromClass(YLZRouteCodeCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        } else if (indexPath.section == 1) {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZRouteCodeRecordCell.self)) as? YLZRouteCodeRecordCell
            if viewCell == nil {
                viewCell = YLZRouteCodeRecordCell(style: .default, reuseIdentifier: NSStringFromClass(YLZRouteCodeRecordCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        } else if (indexPath.section == 2 || indexPath.section == 3) {
            let funcModels:Array<AnyObject> = self.dataArrays[indexPath.section];
            let funcModel:YLZFunctionModel = funcModels[indexPath.row] as! YLZFunctionModel;
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(YLZRouteCodeInfoCell.self)) as? YLZRouteCodeInfoCell
            if viewCell == nil {
                viewCell = YLZRouteCodeInfoCell(style: .default, reuseIdentifier: NSStringFromClass(YLZRouteCodeInfoCell.self))
            }
            viewCell!.selectionStyle = .none
            viewCell!.funcModel = funcModel;
            return viewCell!;
        } else {
            var viewCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(UITableViewCell.self))
            if viewCell == nil {
                viewCell = UITableViewCell(style: .default, reuseIdentifier: NSStringFromClass(UITableViewCell.self))
            }
            viewCell!.selectionStyle = .none
            return viewCell!;
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if (section == 0) {
            let headerView = YLZRouteCodeTableHeaderView()
            return headerView
        }
        let headerView = UIView()
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 0) {
            return 72;
        }
        return 0.00001
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if (section == self.dataArrays.count - 1) {
            let footerView = YLZRouteCodeTableFooterView();
            return footerView;
        } else {
            let footerView = UIView()
            return footerView
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == self.dataArrays.count - 1)  {
            return UITableView.automaticDimension;
        } else {
            return 16;
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 556;
        } else if (indexPath.section == 1) {
            return 96;
        } else {
            return 64;
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

