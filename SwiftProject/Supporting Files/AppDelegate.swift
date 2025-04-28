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
        self.flutterEngine.run();
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
        let tabbarView = InteractiveViewController();
        
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
}
