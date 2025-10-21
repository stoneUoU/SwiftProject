//
//  HiTabbarViewController.swift
//  Hi-Swift-Union
//
//  Created by stone on 2022/4/29.
//

import UIKit

enum HiTabIndex:Int {
    case home = 0
    case mine = 1
}

class HiTabbarViewController: UITabBarController {
    
    @objc lazy var hiTabbar: HiTabBar = {
        let hiTabbar = HiTabBar.init(frame: .zero, tabbarBtnNum: 3)
        return hiTabbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = true;
        self.tabBar.barTintColor = UIColor.white;
        self.tabBar.backgroundColor = UIColor.color_HexStr("#F7F9FD");
        if #available(iOS 13, *) {
            let appearance = self.tabBar.standardAppearance.copy()
            appearance.backgroundImage = UIImage.hi_color(hiColor: .clear)
            appearance.shadowImage = UIImage.hi_color(hiColor: .clear)
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.backgroundImage = UIImage.hi_color(hiColor: .clear)
            self.tabBar.shadowImage = UIImage.hi_color(hiColor: .clear)
        }
        
        self.setUI()
        self.addObserver();
    }
    
    private func setUI() {
        let homeVC:HiHomeViewController = HiHomeViewController();
        let mineVC:HiMineViewController = HiMineViewController();
        self.addViewController(homeVC, "首页", "hi_tabbar_home")
        self.addViewController(mineVC, "我的", "hi_tabbar_mine")
//        self.setupCenterTab(withCenterImage: "hi_tabbar_middle_cert", middleVC: UIViewController());
    }
    
    func addObserver() {
        
    }
    
    private func addViewController(_ vc: UIViewController, _ title: String, _ imageN: String) {
        
        let navVC = HiBaseNavigationController(rootViewController: vc)
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
    func setupCenterTab(withCenterImage centerImage:String, middleVC: UIViewController?) {
        if middleVC != nil {
            var navi: UINavigationController = UINavigationController()
            if let middleVC = middleVC {
                navi = UINavigationController(rootViewController: middleVC)
            }
            self.addChild(navi);
        }
        self.hiTabbar.qrImageView.image = UIImage.init(named: centerImage);
        self.setValue(self.hiTabbar, forKey: "tabBar");
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = tabBar.items?.firstIndex(of: item) {
            switch index {
            case 0:
                print("Tab 0 被选中")
            case 1:
                print("Tab 1 被选中")
            default:
                break
            }
        }
    }
}

