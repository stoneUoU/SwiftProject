//
//  HiInitLoginRespModel.swift
//  SwiftProject
//
//  Created by stone on 2026/4/17.
//

import Foundation
import HandyJSON

class HiInitLoginRespModel: HandyJSON, ObservableObject {
    var certNo: String?
    var certType: String?
    var psnName: String?
    var mobile: String?
    var isChangeDev: Bool = false
    var isOffsite: Bool = false
    var accessToken: String?
    var refreshToken: String?
    required init() {}
}
