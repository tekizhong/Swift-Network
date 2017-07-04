
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

typealias completion = (_ model: AnyObject) -> ()

typealias completionList = (_ list: Array<HTMLModel>) -> ()

class HTMLViewModel: NSObject {
    
    func getList(_ finished: @escaping completionList) {
        Alamofire.request(URL).responseJSON{ (response) in
            if let array = response.result.value as? [[String: Any]] {
                let result = JSONDeserializer<HTMLModel>.deserializeModelArrayFrom(array: array as NSArray?)
                finished(result as! Array)
            }
            else{
                finished([])
            }
        }
    }
    
    
    func getModel(id: String, finished: @escaping completion) {
        Alamofire.request(URL + "/" + id).responseJSON { (response) in
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
