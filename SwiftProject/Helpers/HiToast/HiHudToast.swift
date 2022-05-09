//
//  HiHudToast.swift.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import MBProgressHUD

public class HiHudToast {
    static func showHUD(ctrl:UIViewController) {
        let hud = MBProgressHUD.showAdded(to: ctrl.view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate
    }
    static func show(ctrl:UIViewController,_ message: String) {
    
        let hud = MBProgressHUD.showAdded(to: ctrl.view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate
        hud.label.text = message;
    }
    static func hideHUD(ctrl:UIViewController) {//.hideAllHUDs(for: ctrl.view, animated: true)
        MBProgressHUD.hide(for: ctrl.view, animated: true)
    }
}
