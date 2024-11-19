//
//  Chat.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import Foundation

struct Chat: Codable {
    var id: String
    var participants: [String]
    var lastMessageId: String
    var isWriting: String?
    var unReadMessageCount: [String: Int]
}
