//
//  Observable+HandyJSON.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import RxSwift
import HandyJSON


// MARK: - 类扩展
extension Observable{
    /// 整个 Data Model
    public func mapObject<T: HandyJSON>(type: T.Type) -> Observable<T> {
        return self.map { response in
            //if response is a dictionary, then use ObjectMapper to map the dictionary
            //if not throw an error
            guard let dict = response as? [String: Any] else {
                throw HDSwiftMoyaError.ParseJSONError
            }
            
            return JSONDeserializer<T>.deserializeFrom(dict: dict)!
        }
    }
    
    
    /// Data 对应的 [Model]
    public func mapArray<T: HandyJSON>(type: T.Type)  -> Observable<[T]> {
        
        return self.map { response in
            //if response is a dictionary, then use ObjectMapper to map the dictionary
            //if not throw an error
            guard let array = response as? [Any] else {
                throw HDSwiftMoyaError.ParseJSONError
            }
            guard let dicts = array as? [[String: Any]] else {
                throw HDSwiftMoyaError.ParseJSONError
            }
            
            return JSONDeserializer<T>.deserializeModelArrayFrom(array: dicts)! as! [T]
        }
    }
    
    //    /// 制定的某个 Key 对应的模型
    //    public func mapObject<T: HandyJSON>(_ type: T.Type ,designatedPath: String) -> T?{
    //
    //        guard let dataString = String(data: self.data, encoding: .utf8),
    //            let object = JSONDeserializer<T>.deserializeFrom(json: dataString, designatedPath: designatedPath)
    //            else {
    //                return nil
    //        }
    //
    //        return object
    //    }
    //
    //
    //    /// Data 某个Key 下对应的 的 [Model]
    //    public func mapArray<T: HandyJSON>(_ type: T.Type ,designatedPath: String )  -> [T?]? {
    //        guard let dataString = String(data: self.data, encoding: .utf8),
    //            let object = JSONDeserializer<T>.deserializeModelArrayFrom(json: dataString , designatedPath: designatedPath)
    //            else {
    //                return nil
    //        }
    //        return object
    //    }
    
}


enum HDSwiftMoyaError: String {
    case ParseJSONError
    case OtherError
}

extension HDSwiftMoyaError: Swift.Error { }
