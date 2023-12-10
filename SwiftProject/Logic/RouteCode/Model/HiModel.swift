//
//  HiModel.swift
//  SwiftProject
//
//  Created by stone on 2023/12/9.
//

import Foundation
import HandyJSON
//class HiModel: Decodable {
//
////    @objc var code = 0
////    
////    @objc var imgurl = ""
//}

//class HiModel: Decodable {
//    
//    @objc var name = ""
//
//    @objc var url = ""
//
//    @objc var picurl = ""
//}


class HiBaseModel<T:Decodable> : Decodable,HandyJSON {
    
    var data : T?
    @objc var message : String?
    @objc var code : Int = 0
    
    required init() {
    }
}

class User : Decodable,HandyJSON {
    required init() {
        
    }
    @objc var name = ""
    @objc var url = ""
    @objc var picurl = ""
    @objc var artistsname = ""
    @objc var avatarurl = ""
    @objc var nickname = ""
    @objc var content = ""
}


