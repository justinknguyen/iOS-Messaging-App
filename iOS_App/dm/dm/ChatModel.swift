//
//  ChatModel.swift
//  dm
//
//  Created by Justin Nguyen on 2022-05-20.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var messages: [Message]
    var hasUnreadMessage = false
}

struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

struct Message: Identifiable {
    enum MessageType {
        case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init(_ text: String, type: MessageType, date: Date) {
        self.date = date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

extension Chat {
    static let sampleChat = [
        Chat(person: Person(name: "ESP32-1", imgString: "person.circle"), messages: [
            Message("Hello", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 50)),
            Message("Hi", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 50)),
        ], hasUnreadMessage: true),
        Chat(person: Person(name: "ESP32-2", imgString: "person.circle.fill"), messages: [
            Message("Hello", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 1)),
            Message("Hi", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        ]),
    ]
}
