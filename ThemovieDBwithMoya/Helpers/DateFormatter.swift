//
//  DateFormatter.swift
//  ThemovieDBwithMoya
//
//  Created by TeddyKwak on 2020/07/28.
//  Copyright © 2020 TeddyKwak. All rights reserved.
//

import Foundation

class DF {
    
    static let instance = DateFormatter()
    static func format(date: String) -> String {
        instance.dateFormat = "yyyy-MM-dd"
        guard let date = instance.date(from: date) else { fatalError("could not format date") }
        instance.dateFormat = "MMM, dd"
        return instance.string(from: date)
    }
    
}
