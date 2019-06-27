//
//  ENsDate.swift
//  Payment
//
//  Created by MrFeng on 2019/6/18.
//  Copyright © 2019 MrFeng. All rights reserved.
//

import Foundation

extension NSDate {
    func getDay() ->Int {
        
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: self as Date)
        return day
    }
    
    func getYear() ->Int {
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: self as Date)
        return year
    }
    
    func getMoth() ->Int {
        let calendar = Calendar.current
        
        let month = calendar.component(.month, from: self as Date)
        
        return month
    }
    
    func formatterData() -> String {
        let dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd HH:mm:ss", options: 0, locale: Locale.current)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateString = dateFormatter.string(from: Date.init())
        return dateString
    }
    
}
