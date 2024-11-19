//
//  ProfilePreferences.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import Foundation

enum SignUpStep: String, Codable, CaseIterable {
    case general
    case valuesAndPriorities
    case quiz
    case finished
}

struct UserPreferences: Codable {
    var uid: String?
    var blockedUsers: [String]?
    var likedUsers: [String]?
    var state: LoveState? = LoveState.exploring
    var isComplete: Bool?
    var onBoardingStep: SignUpStep?
    var remainingNotes: Int?
    var lastNoteSendAt: Date?
}
