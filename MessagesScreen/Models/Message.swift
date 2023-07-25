//
//  Message.swift
//  MessagesScreen
//
//  Created by sinem alkin on 11.07.2023.
//

import Foundation
struct Message: Hashable {
    let id: UUID
    let sender: getSender
    let text: String
    var date: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id
    }
}
