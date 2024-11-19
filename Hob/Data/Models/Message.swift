//
//  Message.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//


import Foundation

struct Message: Codable {
    var id: String
    var content: String
    var sendBy: String
    var sendAt: Date
    var isSeen: Bool = false
}
