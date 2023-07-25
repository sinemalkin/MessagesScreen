//
//  Date.swift
//  MessagesScreen
//
//  Created by sinem alkin on 24.07.2023.
//

import Foundation
extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, yyyy"
        formatter.locale = Locale(identifier: "en_US")
        let dayString = formatter.string(from: self)
        return dayString
    }
    func dayFormatter() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "en_US")
        let dayString = dateFormatter.string(from: self)
        return dayString
    }
}
