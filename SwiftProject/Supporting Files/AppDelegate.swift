//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit
import Flutter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    lazy var flutterEngine = FlutterEngine(name: "hi_flutter_module_engine");
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initWindow();
//        self.flutterEngine.run();
        // 初始化友盟推送
        UMengPushHelper.shared.setupUMengPush(
            appKey: "682bdd2b55d24d3412d6f3cf",
            launchOptions: launchOptions
        )
        return true
    }
    
    func initWindow() {
        self.window = UIWindow(frame: HiSCREENBOUNDS);
        let animate = CATransition();
        animate.type = CATransitionType(rawValue: "rippleEffect")
        animate.duration = 1.0;
        self.window?.layer.add(animate, forKey: nil)
        self.window?.makeKeyAndVisible()
//        let tabbarView = A();
//        let tabbarView = YLZRouteCodeViewController();
        let tabbarView = HrssViewController();
        
        let targetVC:UINavigationController = UINavigationController.init(rootViewController: tabbarView)
        self.window?.rootViewController = targetVC;
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
    }
    func application(_ application: UIApplication,
                       didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // 注册设备token
        UMengPushHelper.shared.registerDeviceToken(deviceToken)
    }
        
    func application(_ application: UIApplication,
                   didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("注册推送失败: \(error.localizedDescription)")
    }
}
