
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

typealias HDResult = Result<Any>

typealias completionHander = (_ model: AnyObject) -> ()

typealias completionList = (_ list: Array<HTMLModel>) -> ()

class HTMLViewModel: NSObject {
    
    
    /// 获取列表
    ///
    /// - Parameter finished: 返回的回调
    func getList(_ finished: @escaping completionList) {
        Alamofire.request(HDBaseURL).responseJSON{ (response) in
            if let array = response.result.value as? [[String: Any]] {
                let result = JSONDeserializer<HTMLModel>.deserializeModelArrayFrom(array: array as NSArray?)
                finished(result as! Array)
            }
            else{
                finished([])
            }
        }
    }
    
    
    /// 获取某个id的model
    ///
    /// - Parameters:
    ///   - id: 获取model 的id
    ///   - finished: 回调
    func getModel(id: String, finished: @escaping completionHander) {
        Alamofire.request(HDBaseURL + "/" + id).responseJSON { (response) in
            if let dict = response.result.value as? [String: Any] {
                let result = JSONDeserializer<HTMLModel>.deserializeFrom(dict:  dict as NSDictionary?)
                finished(result!)
            }
            else{
                finished(response.response!)
            }
        }
    }
}
