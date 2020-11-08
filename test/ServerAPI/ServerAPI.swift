//
//  ServerAPI.swift
//  test
//
//  Created by 熊盛 on 2020/11/8.
//

import Foundation
import Moya

let NetworkProvider = MoyaProvider<ServerAPI>()

enum ServerAPI {
    case gitRequest
}

extension ServerAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
}
