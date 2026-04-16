//
//  HiRootClass.swift
//
//
//  Created by JSONConverter on 2026/04/01.
//  Copyright © 2026年 JSONConverter. All rights reserved.
//

import Foundation
import HandyJSON

class HiCategoryModel: Decodable,HandyJSON {
	var food_spu_tags = [HiRootClassFood_spu_tags]()

	required init() {}
}

class HiRootClassFood_spu_tags: Decodable,HandyJSON {
	var buzType: Int = 0
	var current_page: Int = 0
	var description: String?
	var has_next_page: Bool = false
	var icon: String?
	var name: String?
	var product_count: Int = 0
	var selected: Int = 0
	var sequence: Int = 0
	var spus = [HiRootClassFood_spu_tagsSpus]()
	var tag: String?
	var tag_description: String?
	var type: Int = 0

	required init() {}
}

class HiRootClassFood_spu_tagsSpus: Decodable,HandyJSON {
	var activity_policy: HiRootClassFood_spu_tagsSpusActivity_policy?
	var activity_tag: String?
	var activity_type: Int = 0
	var attrs = [String]()
	var description: String?
	var friends_nickname_praise_content: String?
	var friends_praise_content: String?
	var id: Int = 0
	var min_price: Int = 0
	var month_saled: Int = 0
	var month_saled_content: String?
	var name: String?
	var picture: String?
	var praise_content: String?
	var praise_num: Int = 0
	var praise_num_new: Int = 0
	var promotion_info: String?
	var sequence: Int = 0
	var share_tip: HiRootClassFood_spu_tagsSpusShare_tip?
	var sku_label: String?
	var skus = [HiRootClassFood_spu_tagsSpusSkus]()
	var status: Int = 0
	var status_description: String?
	var status_remind_list = [String]()
	var tag: String?
	var tread_num: Int = 0
	var unit: String?

	required init() {}
}

class HiRootClassFood_spu_tagsSpusActivity_policy: Decodable,HandyJSON {
	var discount_by_count: HiRootClassFood_spu_tagsSpusActivity_policyDiscount_by_count?

	required init() {}
}

class HiRootClassFood_spu_tagsSpusActivity_policyDiscount_by_count: Decodable,HandyJSON {
	var count: Int = 0
	var discount: Int = 0

	required init() {}
}

class HiRootClassFood_spu_tagsSpusShare_tip: Decodable,HandyJSON {
	var activity_id: Int = 0
	var description: String?
	var description_icon: String?
	var share_button_icon: String?
	var share_info: HiRootClassFood_spu_tagsSpusShare_tipShare_info?

	required init() {}
}

class HiRootClassFood_spu_tagsSpusShare_tipShare_info: Decodable,HandyJSON {
	var content: String?
	var icon: String?
	var title: String?
	var url: String?

	required init() {}
}

class HiRootClassFood_spu_tagsSpusSkus: Decodable,HandyJSON {
	var activity_stock: Int = 0
	var box_num: Int = 0
	var box_price: Int = 0
	var description: String?
	var id: Int = 0
	var min_order_count: Int = 0
	var origin_price: Int = 0
	var picture: String?
	var price: Int = 0
	var promotion_info: String?
	var real_stock: Int = 0
	var restrict: Int = 0
	var spec: String?
	var status: Int = 0
	var stock: Int = 0

	required init() {}
}
