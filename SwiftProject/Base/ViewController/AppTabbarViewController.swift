//
//  TabbarViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

enum TabIndex:Int {
    case home = 0
    case mine = 1
}

class AppTabbarViewController: UITabBarController {
    
    @objc lazy var ylzTabBar: YLZMSTabBar = {
        let ylzTabBar = YLZMSTabBar.init(frame: .zero, tabbarBtnNum: 3)
        return ylzTabBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = UIColor.white;
        self.setUI()
        self.addObserver();
    }
    
    private func setUI() {
        
        addViewController(ViewController(), "首页", "tabbar_home")
        addViewController(ViewController(), "我的", "tabbar_mine")
    }
    
    func addObserver() {
        
    }
    
    private func addViewController(_ vc: UIViewController, _ title: String, _ imageN: String) {
        
        let navVC = AppBaseNavigationController(rootViewController: vc)
        vc.tabBarItem.image = UIImage(named: imageN)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imageN + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = title
        //设置未选中字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor : UIColor.color_HexStr("#494949")
            ], for: .normal)
        //设置选中字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([
            .foregroundColor : UIColor.color_HexStr("#8676d7")
            ], for: .selected)
        addChild(navVC)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
}
