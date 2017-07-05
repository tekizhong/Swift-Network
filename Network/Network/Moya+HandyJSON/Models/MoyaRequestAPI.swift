//
//  MoyaRequestAPI.swift
//  Network
//
//  Created by Evergrande on 2017/7/5.
//  Copyright © 2017年 Evergrande Group. All rights reserved.
//

import Foundation
import Moya

enum MoyaRequestAPI {
    case Show
    case Create(title: String, body: String, userId: Int)
}

extension MoyaRequestAPI: TargetType {

    var baseURL: URL {
        return URL(string: HDBaseURL)!
    }
    
    var path: String {
        switch self {
        case .Show:
            return ""
        case .Create(_, _, _):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .Show:
            return .get
        case .Create(_, _, _):
            return .post
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .Show:
            return nil
        case .Create(let title, let body, let userId):
            return ["title": title, "body": body, "userId": userId]
        }
    }
    
    var sampleData: Data {
        switch self {
        case .Show:
            return "[{\"userId\": \"1\", \"Title\": \"Title String\", \"Body\": \"Body String\"}]".data(using: String.Encoding.utf8)!
        case .Create(_, _, _):
            return "Create post successfully".data(using: String.Encoding.utf8)!
        }
    }
    
    
    /// The method used for parameter encoding.
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }

    
    var task: Task {
        return .request
    }
}
