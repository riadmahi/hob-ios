//
//  ProfileCard.swift
//  Hob
//
//  Created by Riad on 11/11/2024.
//

import SwiftUI
import WrappingHStack

struct ProfileCard: View {
    
    let profile = Profile(
        uid: "12345",
        email: "safia@example.com",
        name: "Safia",
        gender: .woman,
        birthdate: Date(timeIntervalSince1970: 0),
        photos: [
            "https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=2980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "https://images.unsplash.com/photo-1727160930825-97245483a509?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0fHx8ZW58MHx8fHx8"
        ],
        interests: ["Café", "Voyage", "Randonnées"],
        origins: ["Maghreb"],
        languages: ["Français", "Anglais"],
        personalities: ["Aventurière", "Sociable"],
        geohash: "s1gfa2",
        job: "Banquière",
        biography: "Je suis quelqu’un qui aime les échanges authentiques et sincères...",
        isComplete: true,
        isVisible: true,
        premiumUntil: Date(timeIntervalSince1970: 1700000000),
        creationDate: Date(),
        remainingNotes: 5,
        lastNoteSendAt: Date(timeIntervalSince1970: 1700000000),
        state: .exploring,
        fcmToken: "true"
    )
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Carousel(photos: profile.photos)
            VStack(spacing: 4) {
                HStack(spacing: 8) {
                    Text(profile.name)
                        .brSonomaFont(.bold, 24)
                    Text("22 ans")
                        .brSonomaFont(.regular, 18)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("à 22km, \(profile.job)")
                    .brSonomaFont(.regular, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(profile.biography)
                    .brSonomaFont(.medium, 15)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                WrappingHStack(profile.interests, id: \.self) { interest in
                    ProfileTag(tag: interest, isSelected: true)
                }
                .padding(.top, 12)
                .padding(.bottom, 24)
                
                
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 24)
            
        }
        .frame(maxWidth: .infinity, maxHeight: 600)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
}

#Preview {
    ProfileCard()
        .preferredColorScheme(.dark)
}
