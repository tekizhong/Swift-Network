//
//  HTMLModel.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import HandyJSON

class HTMLModel: HandyJSON {
    
    /// model id
    let id: String = ""
    
    /// 用户id
    var userID: String = ""
    
    /// 
    let title: String = ""
    
    let body: String = ""
    
    required init() {
        
    }
    
    
    func mapping(mapper: HelpingMapper) {
        mapper.specify(property: &userID, name: "userId")
        
        
//        or
//        mapper <<<
//            self.userID <-- "userId"
    }
    
}
