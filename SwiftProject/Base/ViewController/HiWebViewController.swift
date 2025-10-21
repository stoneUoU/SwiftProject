//
//  HiWebViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit
import WebKit


typealias WebViewBackBlock = () -> Void

//初步的webviewController:
    
class HiWebViewController: HiBaseViewController {
    public var webView = WKWebView()
    public var progressView = UIProgressView()
    public var rootView = UIViewController()
    @objc public var isRoot:Bool = false;
    @objc public var titleStr:String = String();
    @objc public var urlStr:String = String();
    @objc public var webViewBackBlock:WebViewBackBlock? = nil
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
//        self.setStatusAndNavigationUI(centerLabelTitle: self.titleStr, rightButtonTitle: "", ifWhiteIMV: true, navigationColor: UIColor.color_HexStr("#1b222b"), centerLabelColor: .white, rightButtonColor: .clear, ifLine: false)
        self.setUI()
//        self.networkLoadingView.showLoadingWithRequest();
    }
    deinit {
        self.progressView.reloadInputViews()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated);
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HiWebViewController {
    func mg_canJumpToExternalApp(with URL: URL?) -> Bool {
        let validSchemes = Set<AnyHashable>(["http", "https"])
        return !validSchemes.contains(URL?.scheme ?? "")
    }
}

extension HiWebViewController:WKNavigationDelegate,WKUIDelegate{//用于与JS交互
    func setUI(){
        self.progressView = UIProgressView(frame: .zero)
        self.progressView.trackTintColor = UIColor.white
        self.progressView.progressTintColor = .red;
        self.navigationView.addSubview(self.progressView)
        self.progressView.snp.makeConstraints{
            (make) -> Void in
            make.bottom.equalTo(self.navigationView.snp.bottom)
            make.left.equalTo(0)
            make.width.equalTo(HiSCREENWIDTH)
            make.height.equalTo(2)
        }
        let encodeString = URL.init(string: "")
//            OCStringTool.wm_string(byURLEncode: self.urlStr)
        self.webView = WKWebView()
        self.webView.navigationDelegate = self
        self.webView.uiDelegate = self;
        var request = URLRequest(url: encodeString as! URL)
        request.setValue("http://mgapp.appearoo.top/", forHTTPHeaderField: "Referer");
        self.webView.load(request)
        self.view.addSubview(self.webView)
        self.webView.snp.makeConstraints{
            (make) -> Void in
            make.top.equalTo(self.view.snp.top).offset(HiStatusBarAndNavigationBarH);
            make.left.equalTo(0)
            make.width.equalTo(HiSCREENWIDTH)
            make.bottom.equalTo(self.view.snp.bottom).offset(-HiTabbarSafeBotM)
        }
        self.webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if (keyPath == "estimatedProgress") {
            self.progressView.isHidden = webView.estimatedProgress == 1
            self.progressView.setProgress(Float(self.webView.estimatedProgress), animated: true)
            if (webView.estimatedProgress == 1) {
//                self.networkLoadingView.hiddenLoadingWithRequest();
            }
        }
    }
    override func toLeft(_ sender :UIButton){
        DispatchQueue.main.async{
            if self.webView.canGoBack {
                self.webView.goBack()
            } else {
                if (self.isRoot) {
                    self.view.window?.rootViewController = self.rootView;
                } else {
                    self.navigationController?.popViewController(animated: true)
                    if self.webViewBackBlock != nil {
                        self.webViewBackBlock!();
                    }
                }
                
            }
        }
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.progressView.setProgress(0.0, animated: false)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        
        if let url = navigationAction.request.url {
            if self.mg_canJumpToExternalApp(with: url) {
//                if UIApplication.shared.canOpenURL(url) {
                    /// 防止iOS 10及其之后，拨打电话系统弹出框延迟出现
                    DispatchQueue.main.async{
                        UIApplication.shared.openURL(url)
                    }
                    decisionHandler(WKNavigationActionPolicy.cancel)
                    return
//                }
            }
        }
        decisionHandler(WKNavigationActionPolicy.allow);
//        var mutableRequest = navigationAction.request;
//        mutableRequest.setValue("http://mgapp.appearoo.top/", forHTTPHeaderField: "Referer");
//        webView.load(mutableRequest);
//        decisionHandler(WKNavigationActionPolicy.allow)
    }
    
}

