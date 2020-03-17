//
//  HTMLModel.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import HandyJSON

class TKMusicModel: HandyJSON {
    var name_en: String?
    var seq_id: String?
    var abbr_en: String?
    var name: String?
    var channel_id: String?
    
    required init() {}
}

class TKChannels: HandyJSON {
    var channels: Array<TKMusicModel>?
    required init() {}
}


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
