//
//  BaseModel.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation

import HandyJSON

class BaseModel: HandyJSON {
    required init() {
        
    }
    
    func mapping(mapper: HelpingMapper) {  // 如果子类有需要自定义的字段必须实现这个方法 作者说的
    }
}
