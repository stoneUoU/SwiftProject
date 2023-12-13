//
//  ViewController.swift
//  SwiftProject
//
//  Created by stone on 2021/5/24.
//

import UIKit
import SwiftyJSON
import Alamofire

class RequestViewController: UIViewController {
    
    let urlString:String = "https://api.uomg.com/api/rand.avatar?sort=男&format=json";
    let parseString:String = "https://api.uomg.com/api/comments.163?format=json";
    let HSAURL:String = "https://fuwu.nhsa.gov.cn/ebus/fuwu/api/base/api/unitCfg";
    
    lazy var titleLabel:UILabel = {[weak self] in
        var titleLabel = UILabel()
        titleLabel.font = YLZFont.bold(size: 22)
        titleLabel.textColor = YLZColorTitleOne
        titleLabel.text = "网 络 请 求 测 试";
        titleLabel.textAlignment = .center;
        return titleLabel
    }()
    
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
    
    @objc lazy var netButton: UIButton = {
        let netButton = UIButton.init(type: UIButton.ButtonType.custom)
        netButton.setTitle("网络请求 测试", for: UIControl.State.normal)
        netButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        netButton.setTitleColor(.black, for: .normal)
        netButton.layer.borderWidth = 0.5;
        netButton.layer.borderColor = UIColor.lightGray.cgColor;
        netButton.layer.cornerRadius = 20;
        netButton.layer.masksToBounds = true;
        netButton.addTarget(self, action: #selector(toExcute(_:)), for: .touchUpInside)
        return netButton
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
        self.view.addSubview(self.netButton)
        self.view.addSubview(self.titleLabel)
        self.setMas();
    }
    
    func setMas() {
        self.registerButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.netButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.top.equalTo(self.registerButton.snp.bottom).offset(24)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
        self.titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.registerButton.snp.top).offset(-54)
            make.size.equalTo(CGSize.init(width: 240, height: 40))
        }
    }
    
    func toShort() {
                
        HiAlamofire.requestData(self.parseString, .GET,parameters: nil,of: HiBaseModel<User>.self) { result in
            let resp:HiBaseModel = result as! HiBaseModel<User>;
            debugPrint(resp.toJSON());
        }

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
        
        if (sender.tag == 0) {
            self.toShort();
        } else {
            self.fetchDatas { boolean in
                if (boolean) {

                }
            };
        }
    }
}

extension RequestViewController {
    
    func fetchDatas(callback:@escaping (_ isBoolean:Bool)->()) {
        var params = Dictionary<String,Any>();
        params["contractVersionQueryDTO"] = ["contractType":4];
        params["noticeTypeParamDTO"] = [:];
        HiAPI.request(.fetchUnitCfg(params), success: { json in
            callback(true);
        }, error: { statusCode in
            callback(true);
        }, failure: { error in
            callback(true);
        })
    }
}
