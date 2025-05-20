import UIKit

class UMengPushHelper: NSObject, UNUserNotificationCenterDelegate {
    static let shared = UMengPushHelper()
    func setupUMengPush(appKey: String, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // 友盟基础组件初始化
        UMConfigure.initWithAppkey(appKey, channel: "App Store")
        // 推送设置
        let entity = UMessageRegisterEntity()
        entity.types = Int(UMessageAuthorizationOptions.badge.rawValue | 
                          UMessageAuthorizationOptions.sound.rawValue | 
                          UMessageAuthorizationOptions.alert.rawValue)
        
        UMessage.registerForRemoteNotifications(launchOptions: launchOptions, entity: entity) { granted, error in
            print("友盟推送授权状态: \(granted), 错误: \(error?.localizedDescription)")
        }
        // 设置推送代理
        UMessage.setAutoAlert(false)
        UNUserNotificationCenter.current().delegate = self
    }
    
    func registerDeviceToken(_ deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device Token: \(token)")
        UMessage.registerDeviceToken(deviceToken)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                               willPresent notification: UNNotification, 
                               withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        if notification.request.trigger is UNPushNotificationTrigger {
            // 友盟处理推送
            UMessage.setAutoAlert(false)
            UMessage.didReceiveRemoteNotification(userInfo)
        }
        completionHandler([.banner, .sound, .badge])
    }
    
    // 点击通知
    func userNotificationCenter(_ center: UNUserNotificationCenter, 
                               didReceive response: UNNotificationResponse, 
                               withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if response.notification.request.trigger is UNPushNotificationTrigger {
            // 友盟处理推送
            UMessage.didReceiveRemoteNotification(userInfo)
        }
        // 处理点击逻辑
        handleNotificationClick(userInfo: userInfo)
        completionHandler()
    }
    
    private func handleNotificationClick(userInfo: [AnyHashable: Any]) {
        // 解析自定义参数
        if let custom = userInfo["custom"] as? [String: Any] {
            print("收到自定义参数: \(custom)")
            // 可以根据参数跳转到特定页面
        }
    }
}
