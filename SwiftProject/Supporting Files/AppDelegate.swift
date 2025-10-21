//
//  AppDelegate.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit
//import Flutter
//import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
//    lazy var flutterEngine = FlutterEngine(name: "hi_flutter_module_engine");
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let options = NSMutableDictionary.init(dictionary: launchOptions ?? [:])
        options.setValue(NSNumber.init(value:true), forKey: "debug")
        DCUniMPSDKEngine.initSDKEnvironment(launchOptions: options as! [AnyHashable : Any]);
        HiUserDefault.shared.setBool(false, forKey: "ACCESS-TOKEN")
        self.initWindow { boolean in
            DispatchQueue.main.async {
//                self.flutterEngine.run()
            }
//            GeneratedPluginRegistrant.register(with: self.flutterEngine);
        };
        // 初始化友盟推送
        UMengPushHelper.shared.setupUMengPush(
            appKey: "682bdd2b55d24d3412d6f3cf",
            launchOptions: launchOptions
        )
        return true
    }
    
    func initWindow(callback:@escaping (_ boolean:Bool)->()) {
        self.window = UIWindow(frame: HiSCREENBOUNDS);
        let animate = CATransition();
        animate.type = CATransitionType(rawValue: "rippleEffect")
        animate.duration = 1.0;
        self.window?.layer.add(animate, forKey: nil)
        self.window?.makeKeyAndVisible()
        let tabbarView = HiTabbarViewController();
        self.window?.rootViewController = tabbarView;
//        let tabbarView = YLZRouteCodeViewController();
//        let tabbarView = InteractiveViewController();
        
//        let targetVC:UINavigationController = UINavigationController.init(rootViewController: tabbarView)
//        self.window?.rootViewController = targetVC;
        callback(true);
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
