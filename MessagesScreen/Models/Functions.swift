//
//  Functions.swift
//  MessagesScreen
//
//  Created by sinem alkin on 20.07.2023.
//

import Foundation
class Functions {
    func howManyDays(messageDate : Date , currentDate : Date ) -> Int {
        let calendar = Calendar.current
        let gunFarki = calendar.dateComponents([.day], from: messageDate, to: currentDate).day ?? 0
            return gunFarki
    }
    func calculateDate(messageDate: Date, daysDifference: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .day, value: -daysDifference, to: messageDate) ?? Date()
    }
}
