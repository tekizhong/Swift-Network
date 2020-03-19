//
//  HTMLRequest.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation

enum HTMLReuqest {
    case requestNone
    case requestByID(id: String)
    case requestBy(id: String,body: String, title:String)
}


extension HTMLReuqest: RequestProtocol {
    var path: String {
        switch self {
        case .requestNone:
            return ""
        default:
            return ""
        }
    }
    
    
    var method: HDHTTPMethod {
        switch self {
        case .requestNone:
            return .get
        case .requestByID(_):
            return .post
        case .requestBy(_, _, _):
            return .post            
        }
    }
    
    var parameter: [String : Any]? {
        switch self {
        case .requestNone:
            return nil
        case .requestByID(let id):
            return ["id":id]
        case .requestBy(let id, let body, let title):
            return ["id":id, "body":body, "title":title]
        }
    }
    
}
