//
//  MoyaRequest.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import Moya
import HandyJSON

class MoyaRequest: NSObject {
    private let provider = MoyaProvider<MoyaRequestAPI>()
    
    func getListModel(success: @escaping (AnyObject?) ->(),
        failure:@escaping (AnyObject?) ->()) {
        provider.request(MoyaRequestAPI.Show) { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    let any = try moyaResponse.mapJSON()
                    let data =  moyaResponse.data
                    let statusCode =  moyaResponse.statusCode
                    print("\(data) --- \(statusCode) ----- \(any)")
                    let model = JSONDeserializer<MoyaHTMLModel>.deserializeFrom(dict: any as? NSDictionary)
                    success(model as AnyObject?)
                } catch {
                    
                }
            case let .failure(error):
                print(error)
                failure(error as AnyObject?)
            }
        }
    }
}
