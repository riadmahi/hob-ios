//
//  NoteCard.swift
//  Hob
//
//  Created by Riad on 13/11/2024.
//

import SwiftUI

struct NoteCard: View {
    var note = "J’ai adoré la description que t’as mis sur ta fois"
    var body: some View {
        VStack(spacing: 16) {
            NoteProfileInfo()
            Text(note)
                .brSonomaFont(.semiBold, 16)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 32) {
                Spacer()
                GhostHobIconButton(iconName: "CloseIcon") {
                    
                }

                HobIconButton(iconName: "CheckIcon") {
                    
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(Color("SecondaryContainerColor"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct NoteProfileInfo: View {
    var profileName: String = "Safia"
    var shortDescription: String = "22 ans, Banquière"
    var profilePhoto: String = "https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=2980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    var timeLeft: String = "2 minutes restantes"

    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                ProfilePhoto(imageUrl: "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", size: 45)
                VStack(alignment: .leading) {
                    Text(profileName)
                        .brSonomaFont(.semiBold, 16)
                    Text(shortDescription)
                        .brSonomaFont(.regular, 13)
                }
            }
            Spacer()
            Text(timeLeft)
                .brSonomaFont(.regular, 12)
                .foregroundColor(Color("PlaceholderColor"))
        }
    }
}
