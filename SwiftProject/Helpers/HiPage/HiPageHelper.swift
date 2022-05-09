//
//  HiPageHelper.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit

public class HiPageHelper: NSObject {
    
    @objc static func pushToNextCtrl(currentController:UIViewController,targetController:UIViewController){
        DispatchQueue.main.async{
            currentController.navigationController?.pushViewController(targetController , animated: true)
        }
    }
    
    @objc static func popToPreviousCtrl(currentController:UIViewController){
        DispatchQueue.main.async{
            currentController.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc static func popToAppointedCtrl(currentController:UIViewController,targetControllerClass:AnyClass,animated: Bool = true){
        DispatchQueue.main.async{
            let temporaryControllerArray: [UIViewController]? = currentController.navigationController?.viewControllers
            for targetController: UIViewController in temporaryControllerArray! {
                if (targetController.isKind(of: targetControllerClass)) {
                    currentController.navigationController?.popToViewController(targetController, animated: animated)
                }
            }
        }
    }
    
    @objc static func presentToNavigationController(currentController:UIViewController,targetController:UIViewController,animated:Bool){
        let nav = UINavigationController(rootViewController: targetController)
        nav.modalTransitionStyle = .coverVertical
//        targetController.modalPresentationStyle = .overFullScreen
        nav.modalPresentationStyle = .fullScreen;
        DispatchQueue.main.async{
            currentController.present(nav, animated: animated, completion: nil)
        }
    }
    
    @objc static func presentToCommonController(currentController:UIViewController,targetController:UIViewController,animated:Bool){
        DispatchQueue.main.async{
            currentController.present(targetController, animated: animated, completion: nil)
        }
    }
    @objc static func dismissCurrentController(currentController:UIViewController,animated:Bool){
        
        DispatchQueue.main.async{
            currentController.dismiss(animated: animated, completion: nil)
        }
    }
    
    @objc class  func getCurrentController() -> UIViewController? {
        guard let window = UIApplication.shared.windows.first else {
            return nil
        }
        var tempView: UIView?
        for subview in window.subviews.reversed() {
            if subview.classForCoder.description() == "UILayoutContainerView" {
                
                tempView = subview
                
                break
            }
        }
        if tempView == nil {
            tempView = window.subviews.last
        }
        var nextResponder = tempView?.next
        var next: Bool {
            return !(nextResponder is UIViewController) || nextResponder is UINavigationController || nextResponder is UITabBarController
        }
        while next{
            tempView = tempView?.subviews.first
            if tempView == nil {
                return nil
            }
            nextResponder = tempView!.next
        }
        return nextResponder as? UIViewController
    }
}
