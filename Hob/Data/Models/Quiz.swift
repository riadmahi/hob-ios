//
//  Quiz.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

struct QuizData: Codable {
    let quiz: Quiz
    let categories: [Category]
}

struct Quiz: Codable {
    let title: String
    let description: String
    let questions: [Question]
}

struct Question: Codable, Identifiable {
    let id: Int
    let text: String
    let answers: [Answer]
}

struct Answer: Codable, Identifiable {
    let id: String
    let text: String
    let category: String
}

struct Category: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
