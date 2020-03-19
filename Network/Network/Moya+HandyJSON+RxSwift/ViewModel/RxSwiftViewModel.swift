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
    
    private let provider = MoyaProvider<RxRequestAPI>()
    
//    func getPosts() -> Observable<RxHTMLModel> {
//        return provider.rx.request(.Show)
//                .filterSuccessfulStatusCodes()
//                .mapJSON()
//                .mapObject(type: RxHTMLModel.self)
//    }
}
