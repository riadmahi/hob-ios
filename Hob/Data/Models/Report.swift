//
//  Report.swift
//  Hob
//
//  Created by Riad on 19/11/2024.
//

import Foundation

struct Report: Codable {
    var id: String
    var reporterId: String
    var reportedId: String
    var reason: String
    var extraMessage: String?
    var verified: Bool
    var reportAt: Date
}
