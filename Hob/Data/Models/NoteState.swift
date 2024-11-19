//
//  NoteState.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//


import Foundation


enum NoteState: String, Codable {
    case accepted
    case refused
    case unmatched
    case expired
}

struct Note: Codable {
    var id: String
    var sendBy: String
    var receiver: String
    var note: String
    var state: NoteState
    var updatedAt: Date
    var sendAt: Date
    var isVisible: Bool
}
