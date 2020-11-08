//
//  Date+Extension.swift
//  test
//
//  Created by 熊盛 on 2020/11/8.
//

import Foundation

extension Date {
  
    static func getDateFormatString() ->String{
        let timeStamp = Date.init()

        //10位数时间戳

        let interval = Int(timeStamp.timeIntervalSince1970)
        
        let date = Date(timeIntervalSince1970: TimeInterval(interval))

        let dateformatter = DateFormatter()

        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        return dateformatter.string(from: date)

    }
}
