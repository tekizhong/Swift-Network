//
//  RequestProtocol.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import Alamofire

typealias HDHTTPMethod = HTTPMethod


/// 请求协议
protocol RequestProtocol {
    
    /// 路径
    var path: String{ get }
    
    /// 请求方式
    var method: HDHTTPMethod{ get }
    
    /// 请求参数
    var parameter: [String: Any]? { get }
    
}
