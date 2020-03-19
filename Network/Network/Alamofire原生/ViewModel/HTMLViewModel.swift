
//
//  HTMLViewModel.swift
//  Network
//
//  Created by Evergrande on 2017/7/4.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON

typealias HDResult = Result<Any,AFError>

typealias completionHander = (_ model: AnyObject) -> ()


class HTMLViewModel: NSObject {
    /// 获取歌曲目录
    ///
    /// - Parameters:
    ///
    ///   - finished: 回调
    func getModel(_ finished: @escaping completionHander) {
        
        AF.request(HDBaseURL).responseJSON { (response) in
//            if #available(iOS 10.0,*) {
//                print(response.metrics)
//            }
            switch response.result {
            case .success(let value):
                if let dict = value as? [String: Any] {
                    let result = JSONDeserializer<TKChannels>.deserializeFrom(dict:  dict as NSDictionary?)
                    finished(result!)
                }
            case .failure(_):
                if let res = response.response {
                    finished(res)
                }else {
                    finished("服务器无响应" as AnyObject)
                }
                
            }
            
        }
    }
}
