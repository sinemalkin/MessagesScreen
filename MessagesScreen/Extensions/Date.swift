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
        let dateString = formatter.string(from: self)
        return dateString
    }
    func dayFormatter() -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "EEEE"
        dayFormatter.locale = Locale(identifier: "en_US")
        let dayString = dayFormatter.string(from: self)
        return dayString
    }
    func hourFormatter() -> String {
        let hourFormatter = DateFormatter()
        hourFormatter.dateFormat = "HH:mm"
        hourFormatter.timeZone = TimeZone(identifier: "Europe/Istanbul")
        let hourString = hourFormatter.string(from: self)
        return hourString
    }
}
