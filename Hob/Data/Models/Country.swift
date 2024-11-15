//
//  Country 2.swift
//  Hob
//
//  Created by Riad on 15/11/2024.
//


import Foundation

struct Country: Identifiable, Decodable {
    var id: String { return pays }
    let pays: String
    let emoji: String
}