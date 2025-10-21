//
//  AppBaseNavigationController.swift
//  AppManage
//
//  Created by stone on 2021/5/22.
//

import UIKit

class HiBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }

    @objc private func toBack() {
        popViewController(animated: true)
    }
}
