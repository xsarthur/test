//
//  Dictionary+Extension.swift
//  test
//
//  Created by 熊盛 on 2020/11/8.
//

import Foundation

extension Dictionary {
    // MARK: 字典转字符串
    func toJsonString() -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: self,
                                                     options: []) else {
            return nil
        }
        guard let str = String(data: data, encoding: .utf8) else {
            return nil
        }
        return str
     }
    
}
