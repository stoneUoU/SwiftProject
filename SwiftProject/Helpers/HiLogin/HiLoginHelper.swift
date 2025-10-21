//
//  HiLoginHelper.swift
//  Hi-Helper-Module
//
//  Created by stone on 2022/5/5.
//

import UIKit

open class HiLoginHelper:NSObject {
    
    @objc static var shared: HiLoginHelper {
        struct Static {
            static let sharedInstance = HiLoginHelper()
        }
        return Static.sharedInstance;
    }
    
    @objc func toExcute() {
        
    }
    
    func loginWithSuccess(viewController:UIViewController,loginHandle:@escaping (_ isSuccess:Bool) -> Void) {
        if (HiLoginHelper.shared.isLogined()) {
            loginHandle(true);
        } else {
            let loginView = HiLoginViewController();
            loginView.loginHandle = loginHandle;
            let nav = UINavigationController(rootViewController: loginView)
            nav.modalTransitionStyle = .coverVertical
            nav.modalPresentationStyle = .fullScreen;
            DispatchQueue.main.async{
                viewController.present(nav, animated: true, completion: nil)
            }
            HiToast().showToast(text: "您暂未登录，请先登录！",type: .bottom);
        }
    }
    
    func isLogined() -> Bool {
        return HiUserDefault.shared.boolean(forKey: "ACCESS-TOKEN") ?? false;
    }
}


