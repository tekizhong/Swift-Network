//
//  RequestManager.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import Alamofire
import HandyJSON

protocol HDClient {
    var host: String { get }
    
    /// 获取单个model
    ///
    /// - Parameters:
    ///   - r: 请求类型
    ///   - responseType: 返回类型
    ///   - handler: 回调
    func sendGetWithResponseModel<T: RequestProtocol,R: HandyJSON>(_ r: T, responseType: R.Type,handler: @escaping (R?) -> Void)
    
    /// 获取列表
    ///
    /// - Parameters:
    ///   - r: 请求类型
    ///   - responseType: 返回列表的类型
    ///   - handler:
    func sendGetWithResponseList<T: RequestProtocol,R: HandyJSON>(_ r: T, responseType: R.Type,handler: @escaping ([R]?) -> Void)
    
    
    /// 通用请求 根据返回的是数组还是对象自己判断
    ///
    /// - Parameters:
    ///   - r: 请求类型
    ///   - responseType:
    ///   - handler:
    func sendGetWithResponse<T: RequestProtocol,R: HandyJSON>(_ r: T, responseType: R.Type,handler: @escaping (AnyObject?) -> Void)

}


class RequestManager: HDClient {

    var host: String = HDBaseURL

    internal func sendGetWithResponseModel<T : RequestProtocol, R : HandyJSON>(_ r: T, responseType: R.Type, handler: @escaping (R?) -> Void) {
        let url = host.appending(r.path)
        AF.request(url).responseJSON { (response) in
            if case let .success(value) = response.result,
                let dict = value as? NSDictionary {
                let res = JSONDeserializer<R>.deserializeFrom(dict: dict  as NSDictionary?)!
                DispatchQueue.main.async { handler(res) }
            }else {
                DispatchQueue.main.async { handler(nil)}
            }
                
//            if response.result.value != nil {
//                if let dict = response.result.value as? NSDictionary {
//                    let res = JSONDeserializer<R>.deserializeFrom(dict: dict  as NSDictionary?)!
//                    DispatchQueue.main.async { handler(res) }
//                }
//                    
//                else {
//                    DispatchQueue.main.async { handler(nil)}
//                }
//            }else{
//                DispatchQueue.main.async { handler(nil)}
//            }
        }
    }

    
    
    func sendGetWithResponseList<T: RequestProtocol,R: HandyJSON>(_ r: T, responseType: R.Type,handler: @escaping ([R]?) -> Void) {
        let url = host.appending(r.path)
        
        
        AF.request(url).responseJSON { (response) in
            if case let .success(value) = response.result,
                let array = value as? NSArray {
                let res = JSONDeserializer<R>.deserializeModelArrayFrom(array: array as NSArray)!
                DispatchQueue.main.async { handler(res as? [R]) }
            }else {
                DispatchQueue.main.async { handler(nil)}
            }
            
//            if response.result.value != nil {
//                if let array = response.result.value as? NSArray {
//                    let res = JSONDeserializer<R>.deserializeModelArrayFrom(array: array as NSArray)!
//                    DispatchQueue.main.async { handler(res as? [R]) }
//                }
//
//                else {
//                    DispatchQueue.main.async { handler(nil)}
//                }
//            }else{
//                DispatchQueue.main.async { handler(nil)}
//            }
        }
    }
    
    
    func sendGetWithResponse<T: RequestProtocol,R: HandyJSON>(_ r: T, responseType: R.Type,handler: @escaping (AnyObject?) -> Void) {
        let url = host.appending(r.path)
        AF.request(url).responseJSON { (response) in
            
            if case let .success(value) = response.result {
                
                if let dict = value as? NSDictionary {
                    let res = JSONDeserializer<R>.deserializeFrom(dict: dict  as NSDictionary?)!
                    DispatchQueue.main.async { handler(res as AnyObject?) }
                }
                else if (value as? NSArray) != nil {
                    let res = JSONDeserializer<R>.deserializeModelArrayFrom(array: value as? NSArray)!
                    DispatchQueue.main.async { handler(res as AnyObject?) }
                }
                else {
                    DispatchQueue.main.async { handler(nil)}
                }
            }else {
                DispatchQueue.main.async { handler(nil)}

            }
//            if response.result.value != nil {
//                if let dict = response.result.value as? NSDictionary {
//                    let res = JSONDeserializer<R>.deserializeFrom(dict: dict  as NSDictionary?)!
//                    DispatchQueue.main.async { handler(res as AnyObject?) }
//                }
//                else if (response.result.value as? NSArray) != nil {
//                    let res = JSONDeserializer<R>.deserializeModelArrayFrom(array: response.result.value as? NSArray)!
//                    DispatchQueue.main.async { handler(res as AnyObject?) }
//                }
//                else {
//                    DispatchQueue.main.async { handler(nil)}
//                }
//            }else{
//                DispatchQueue.main.async { handler(nil)}
//            }
        }
    }
    
    
    
}
