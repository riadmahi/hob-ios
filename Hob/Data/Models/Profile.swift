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
    var birthDate: Date
    var photos: [String]
    var interests: [String]
    var origins: [String]
    var personality: String
    var geohash: String
    var job: String
    var spirituality: String
    var spiritualityPractice: String
    var spiritualityImportance: String
    var values: [String]
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

let mockProfile = Profile(
    uid: "12345",
    email: "user@example.com",
    name: "Safia",
    gender: .woman,
    birthDate: Date(),
    photos: [
        "https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=2980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1727160930825-97245483a509?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0fHx8ZW58MHx8fHx8"
    ],
    interests: ["Voyages ✈️", "Lecture 📚", "Cuisine 🍳", "Yoga 🧘‍♀️", "Cinéma 🎬", "Musique 🎶", "Photographie 📸", "Randonnée 🥾", "Technologie 💻", "Sport ⚽️", "Art 🎨", "Mode 👗", "Voyages en famille 🏖️", "Jeux vidéo 🎮", "Méditation 🧘‍♂️"],
    origins: ["🇫🇷 France", "🇩🇿 Algérie"],
    personality: "RéfléchiSpirituel",
    geohash: "u4pruydqqvj",
    job: "Software Engineer",
    spirituality: "Islam",
    spiritualityPractice: "Pratiquant",
    spiritualityImportance: "Essentielle",
    values: ["Famille", "Respect", "Honnêteté"],
    biography: "Je suis une personne passionnée par la vie et les nouvelles expériences. J'aime rencontrer de nouvelles personnes, partager des moments de complicité et construire des liens sincères. Toujours curieuse, j'adore explorer de nouvelles cultures, voyager et découvrir de nouveaux horizons. Je crois en l'importance de la communication, de la bienveillance et du respect dans une relation. Si tu recherches quelqu'un avec qui rire, échanger et grandir ensemble, alors nous pourrions bien nous entendre !",
    isComplete: true,
    isVisible: true,
    premiumUntil: Date().addingTimeInterval(60*60*24*30), // One month from now
    creationDate: Date(),
    remainingNotes: 5,
    lastNoteSendAt: Date().addingTimeInterval(-60*60*6), // 6 hours ago
    state: .exploring,
    fcmToken: "fcm_token_sample_string"
)
        
