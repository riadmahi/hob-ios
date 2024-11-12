//
//  Profile.swift
//  Hob
//
//  Created by Riad on 11/11/2024.
//

import Foundation

struct Profile: Codable {
    var uid: String
    var email: String
    var name: String
    var gender: Gender
    var birthdate: Date
    var photos: [String]
    var interests: [String]
    var origins: [String]
    var languages: [String]
    var personalities: [String]
    var geohash: String
    var job: String
    var biography: String
    var isComplete: Bool
    var isVisible: Bool
    var premiumUntil: Date?
    var creationDate: Date
    var remainingNotes: Int
    var lastNoteSendAt: Date?
    var state: LoveState
    var fcmToken: String
}
