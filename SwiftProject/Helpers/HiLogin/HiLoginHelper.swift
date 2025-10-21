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
    
    func loginWithSuccess(loginHandle:@escaping (_ isSuccess:Bool) -> Void) {
        if (HiLoginHelper.shared.isLogined()) {
            loginHandle(true);
        } else {
            let loginView = HiLoginViewController();
            loginView.loginHandle = loginHandle;
            HiPageHelper.fetchCurrentController()?.navigationController?.pushViewController(loginView, animated: true);
        }
    }
    
    func isLogined() -> Bool {
        return HiUserDefault.shared.boolean(forKey: "ACCESS-TOKEN") ?? false;
    }
}


