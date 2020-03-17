
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

typealias completionList = (_ list: Array<HTMLModel>) -> ()

class HTMLViewModel: NSObject {
    
    
    /// 获取列表
    ///
    /// - Parameter finished: 返回的回调
    func getList(_ finished: @escaping completionList) {
        
        AF.request(HDBaseURL).responseJSON(){ (response) in
            
            switch response.result {
            case .success(let value):
                if let array = value as? [[String: Any]]  {
                 let result = JSONDeserializer<HTMLModel>.deserializeModelArrayFrom(array: array as NSArray?)
                 finished(result as! Array)
                }else {
                    finished([])
                }
            case .failure(_):
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
        
        AF.request(HDBaseURL).responseJSON { (response) in
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
        
//        AF.request(HDBaseURL + "/" + id).responseJSON { (response) in
//            if case let .success(value) = response.result,
//                let dict = value as? [String: Any] {
//                let result = JSONDeserializer<TKChannels>.deserializeFrom(dict:  dict as NSDictionary?)
//                finished(result!)
//            }else{
//                if let res = response.response {
//                    finished(res)
//                }else {
//                    finished("服务器无响应" as AnyObject)
//                }
//            }
//        }
    }
}
