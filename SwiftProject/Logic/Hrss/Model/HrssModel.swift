//
//  HrssModel.swift
//  SwiftProject
//
//  Created by stone on 2025/6/11.
//

import Foundation
import SwiftyJSON

class HrssModel {
    var title: String
    var iconUrl: String
    var bgUrl: String
    var tag: String
    init(json: JSON) {
        title = json["title"].stringValue
        iconUrl = json["iconUrl"].stringValue
        bgUrl = json["bgUrl"].stringValue
        tag = json["tag"].stringValue
    }
}
