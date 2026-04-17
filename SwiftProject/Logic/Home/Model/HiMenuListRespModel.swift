//
//  HiMenuListRespModel.swift
//
//
//  Created by JSONConverter on 2026/04/17.
//  Copyright © 2026年 JSONConverter. All rights reserved.
//

import Foundation
import HandyJSON

class HiMenuListRespModel: HandyJSON {
    var data = [HiMenuListModel]()
    required init() {}
}


class HiMenuListModel: HandyJSON {
	var children = [HiMenuModel]()
	var key: String?
	var name: String?

	required init() {}
}

class HiMenuModel: HandyJSON {
	var aliUrl: String?
	var androidUrl: String?
	var cityCode: String?
	var createTime: Int = 0
	var dataStatus: String?
	var description: String?
	var founder: String?
	var founderAcct: String?
	var functionKind: String?
	var functionKindName: String?
	var functionName: String?
	var functionStatus: String?
	var id: Int = 0
	var iosUrl: String?
	var isAliHomeShow: String?
	var isAliShow: String?
	var isAndroidHomeShow: String?
	var isAndroidShow: String?
	var isConvenient: String?
	var isHarmonyOSHomeShow: String?
	var isHarmonyOSShow: String?
	var isHot: String?
	var isIosHomeShow: String?
	var isIosShow: String?
	var isNeedLogin: String?
	var isServe: String?
	var isWechatHomeShow: String?
	var isWechatShow: String?
	var modifier: String?
	var modifierAcct: String?
	var newTopKind: String?
	var newTopSort: String?
	var serveImgUrl: String?
	var sort: Int = 0
	var topImgUrl: String?
	var topKind: String?
	var topNewImgUrl: String?
	var topSort: String?
	var updateTime: Int = 0
	var wechatUrl: String?

	required init() {}
}
