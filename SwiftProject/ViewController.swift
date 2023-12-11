//
//  ViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit
import Flutter
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    let urlString:String = "https://api.uomg.com/api/rand.avatar?sort=男&format=json";
    let parseString:String = "https://api.uomg.com/api/comments.163?format=json";
    let HSAURL:String = "https://fuwu.nhsa.gov.cn/ebus/fuwu/api/base/api/unitCfg";
    
    var channel:FlutterEventChannel?
    var eventSink:FlutterEventSink?
    
    @objc lazy var registerButton: UIButton = {
        let registerButton = UIButton.init(type: UIButton.ButtonType.custom)
        registerButton.setTitle("Swift Project", for: UIControl.State.normal)
        registerButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.borderWidth = 0.5;
        registerButton.layer.borderColor = UIColor.lightGray.cgColor;
        registerButton.layer.cornerRadius = 20;
        registerButton.layer.masksToBounds = true;
        registerButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return registerButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI();
    }
    
    override func viewWillAppear(_ animated: Bool){
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setUI() {
        self.view.backgroundColor = .white;
        self.view.addSubview(self.registerButton)
        
        self.setMas();
    }
    
    func setMas() {
        self.registerButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
    }
    
    func toShort() {
        
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine;
        let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil);
        let methodChannel:FlutterMethodChannel = FlutterMethodChannel.init(name: "EVENT_FLUTTER_SEND_MESSAGE_IOS", binaryMessenger: flutterViewController.binaryMessenger);
        
        self.channel = FlutterEventChannel(name: "EVENT_IOS_SEND_MESSAGE_FLUTTER", binaryMessenger: flutterViewController.binaryMessenger)
        self.channel?.setStreamHandler(self)
//        
        methodChannel.setMethodCallHandler { (call:FlutterMethodCall, result:@escaping FlutterResult) in
            if let dict = call.arguments as? Dictionary<String, Any> {
                print("dict________\(dict)");
            }
            if (call.method == "flutterIOSMethod") {
//                result(["name": "iOS-Swift 林磊 原生开发", "age":27, "certNo":"362324199610016010"]);
                HiAlamofire.requestData(self.parseString, .GET,parameters: nil,of: HiBaseModel<User>.self) { json in
                    let resp:HiBaseModel = json as! HiBaseModel<User>;
                    result(resp.toJSON());
                }
            } else if (call.method == "backToViewController") {
                self.navigationController?.popViewController(animated: true);
            } else if (call.method == "iOSFlutterMethodToPage") {
                let vc:YLZRouteCodeViewController = YLZRouteCodeViewController();
                self.navigationController?.pushViewController(vc, animated: true);
            }
        };
        
//        let eventChannelManager = EventChannelManager(messager: flutterViewController.binaryMessenger)
//        eventChannelManager.config()
        
        //swift 发送信息给flutter
//        let dic:[String:String] = ["hello":"flutter"];
//        self.eventSink?(dic)
        self.navigationController?.pushViewController(flutterViewController, animated: true)
        
//        HiAlamofire.requestData(self.parseString, .GET,parameters: nil,of: HiBaseModel<User>.self) { result in
//            let resp:HiBaseModel = result as! HiBaseModel<User>;
//            debugPrint(resp.toJSON());
//        }
//
//        AF.request(urlString).responseDecodable(of: HiModel.self) { response in
//            let resp:HiModel = response.value!;
//            debugPrint("Response: \(resp.imgurl)")
//        }

//        HiAlamofire.requestData(urlString, .GET, parameters: nil, of: HiModel.self) { (json:Any) in
//            YLZLog("________\(json)");
////            if JSON(json)["code"] == 1 {
////                let codeString = "\(JSON(json)["short"])";
////                let pasteboard:UIPasteboard = UIPasteboard.general;
////                pasteboard.string = codeString;
////                Toast().showToast(text:"复制成功",isWhite: false,type:Pos)
////            } else {
////                Toast().showToast(text:"\(JSON(json)["msg"])",isWhite: false,type:Pos)
////            }
//        }
//        var params = Dictionary<String,Any>();
//        params["contractVersionQueryDTO"] = ["contractType":4];
//        params["noticeTypeParamDTO"] = [:];
//        var sendParams: [String: Any] = ["appId":"19E179E5DC29C05E65B90CDE57A1C7E5","encType":"plain","signType":"plain","timestamp":"1652165413","transType":"ec.queryCode","version":"1.0.0"];
//        sendParams["data"] = params;
//        HiAlamofire.requestData(HSAURL, .POST,parameters: sendParams,of: HiBaseModel<User>.self) { result in
//            let resp:HiBaseModel = result as! HiBaseModel<User>;
//            debugPrint(resp.toJSON());
//        }
    }
    
    @objc func toExcute(_ sender: UIButton) {
        self.toShort();
    }
}


extension ViewController:FlutterStreamHandler {  //FlutterBinaryMessenger
//    func send(onChannel channel: String, message: Data?) {
//        <#code#>
//    }
//    
//    func send(onChannel channel: String, message: Data?, binaryReply callback: FlutterBinaryReply? = nil) {
//        <#code#>
//    }
//    
//    func setMessageHandlerOnChannel(_ channel: String, binaryMessageHandler handler: FlutterBinaryMessageHandler? = nil) -> FlutterBinaryMessengerConnection {
//        <#code#>
//    }
//    
//    func cleanUpConnection(_ connection: FlutterBinaryMessengerConnection) {
//        <#code#>
//    }
    
    
    //ios 主动给flutter 发送消息回调方法
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        self.eventSink = events;
        return nil
    }
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
}


