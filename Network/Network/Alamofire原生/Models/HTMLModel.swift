//
//  HTMLModel.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import HandyJSON

class TKMusicModel: BaseModel {
    var nameEn: String?
    var seqId: String?
    var abbrEn: String?
    var name: String?
    var channelId: String?
    
    required init() {}
    
    override func mapping(mapper: HelpingMapper) {
        mapper <<<
          nameEn <-- "name_en"
        mapper <<<
          seqId <-- "seq_id"
        mapper <<<
            abbrEn <-- "abbr_en"
        mapper <<<
          channelId <-- "channel_id"
    }
}

class TKChannels: BaseModel {
    var channels: Array<TKMusicModel>?
    required init() {}
    
    
}


/// TODO: 下面这个model弃用
//class HTMLModel: HandyJSON {
//
//    /// model id
//    let id: String = ""
//
//    /// 用户id
//    var userID: String = ""
//
//    ///
//    let title: String = ""
//
//    let body: String = ""
//
//    required init() {
//
//    }
//
//
//    func mapping(mapper: HelpingMapper) {
//        mapper.specify(property: &userID, name: "userId")
//
//
////        or
////        mapper <<<
////            self.userID <-- "userId"
//    }
//
//}
