//
//  HiEncrypt.swift
//  SwiftProject
//
//  Created by stone on 2026/4/16.
//

import GMObjC

class HiEncrypt {
    static func encrypt(params: [String: Any])->[String: Any] {
        var encParams: [String: Any] = ["appCode":HiAppId,"encType":"SM4","signType":"plain","timestamp":"1652165413","version":"1.0.0","signData":""];
        encParams["data"] = params
        let cipherHex = YLZNetEncryptManager.encryptData(params, appId: HiAppId, appSecret: HiSm4KeySe, encryptType: "SM4", encodeType: "hex")
        encParams["encData"] = cipherHex;
        return encParams;
    }
    
    static func decrypt(encData: String)->[String: Any] {
        let decryptedParams:[String:Any] = YLZNetEncryptManager.decryptData(encData, appId: HiAppId, appSecret: HiSm4KeySe, encryptType: "SM4", encodeType: "hex") as! [String : Any];
        return decryptedParams;
    }
}
