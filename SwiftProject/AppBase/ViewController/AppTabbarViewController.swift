//
//  TabbarViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

enum TabIndex:Int {
    case home = 0
    case announce = 1
    case task = 2
    case mine = 3
}

class AppTabbarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.setUI()
        self.addObserver();
    }
    
    private func setUI() {
        
//        addViewController(MGHomeTitleViewController(), "首页", "tabBar_home")
//        addViewController(MovieTopicsViewController(), "专题", "tabBar_announce")
//        addViewController(TaskViewController(), "任务", "tabBar_task")
//        addViewController(MineViewController(), "我的", "tabBar_me")
    }
    
    func addObserver() {
        
    }
    
    private func addViewController(_ vc: UIViewController, _ title: String, _ imageN: String) {
        
        let navVC = AppBaseNavigationController(rootViewController: vc)
        vc.tabBarItem.image = UIImage(named: imageN)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: imageN + "_s")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.title = title
        //设置未选中字体颜色
//        UITabBarItem.appearance().setTitleTextAttributes([
//            .foregroundColor : UIColor.color_HexStr("#494949")
//            ], for: .normal)
//        //设置选中字体颜色
//        UITabBarItem.appearance().setTitleTextAttributes([
//            .foregroundColor : UIColor.color_HexStr("#8676d7")
//            ], for: .selected)
        addChild(navVC)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if ("\(item.title!)" == "我的") {
        } else if ("\(item.title!)" == "首页") {
        }
    }
}
