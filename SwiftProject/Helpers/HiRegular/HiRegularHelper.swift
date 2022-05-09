//
//  HiRegularHelper.swift
//  OLMovie
//
//  Created by stone on 2019/9/1.
//  Copyright © 2019 Stone. All rights reserved.
//

import UIKit

enum HiRegularHelperType {
    case Email
    case Mobile
    case LoginCode
    case PayForCode
    case IdCard
    case Card
}

public class HiRegularHelper:NSObject {
    
    static func validateText(validatedType type: HiRegularHelperType, validateString: String) -> Bool {
        do {
            let pattern: String
            if type == HiRegularHelperType.Email {
                pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            } else if type == HiRegularHelperType.Mobile {
                pattern = "^1[0-9]{10}$"
            } else if type == HiRegularHelperType.LoginCode {
                pattern = "^\\w{6,15}$"
            } else if type == HiRegularHelperType.IdCard {
                pattern = "(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)|(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}[0-9Xx]$)"
            } else if type == HiRegularHelperType.Card {
                pattern = "^(\\d{16}|\\d{19})$"
            } else {
                pattern = "^\\d{6}$"
            }
            let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let matches = regex.matches(in: validateString, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, (validateString as NSString).length))
            return matches.count > 0
        }
        catch {
            return false
        }
    }
    //邮箱
    static func emailIsValidated(vStr: String) -> Bool {
        return self.validateText(validatedType: HiRegularHelperType.Email, validateString: vStr)
    }
    //手机号
    public static func mobileIsValidated(vStr: String) -> Bool {
        return self.validateText(validatedType: HiRegularHelperType.Mobile, validateString: vStr)
    }
    //登录密码
    static func loginCodeIsValidated(vStr: String) -> Bool {
        return self.validateText(validatedType: HiRegularHelperType.LoginCode, validateString: vStr)
    }
    //支付密码
    static func payForCodeIsValidated(vStr: String) -> Bool {
        return self.validateText(validatedType: HiRegularHelperType.PayForCode, validateString: vStr)
    }
    //身份证
    static func idCardIsValidated(vStr: String) -> Bool {
        return self.validateText(validatedType: HiRegularHelperType.IdCard, validateString: vStr)
    }
    //银行卡
    static func cardIsValidated(vStr: String) -> Bool {
        return self.validateText(validatedType: HiRegularHelperType.Card, validateString: vStr)
    }
}
