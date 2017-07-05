//
//  RxSwiftViewModel.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import RxSwift
import Moya

class RxSwiftViewModel {
    
    
    private let provider = RxMoyaProvider<RxRequestAPI>()
    
    func getPosts() -> Observable<[RxHTMLModel]> {
        return provider.request(.Show)
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .mapArray(type: RxHTMLModel.self)
    }
    
    
    
    func createPost(title: String, body: String, userId: Int) -> Observable<RxHTMLModel> {
        return provider.request(.Create(title: title, body: body, userId: userId))
            .mapJSON()
            .mapObject(type: RxHTMLModel.self)
    }
}
