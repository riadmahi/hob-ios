//
//  ProfileView.swift
//  Hob
//
//  Created by Riad on 13/11/2024.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            ProfilePhotoSection()
            PremiumUntilCard()
                .padding(.horizontal, 32)
            Spacer()
            VStack(alignment: .leading) {
                Text("À propos de mon compte")
                    .brSonomaFont(.semiBold, 14)
                VStack(spacing: 0) {
                    ProfileNavigationSection(navigationName: "Modifier mon profil")
                    ProfileNavigationSection(navigationName: "Gérer mon compte")
                    ProfileNavigationSection(navigationName: "Paramètres de l'application")
                    ProfileNavigationSection(navigationName: "Mise en relation avec le support")
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(.bottom, 32)
        }
        .padding(.horizontal, 12)
    }
}

struct ProfileNavigationSection: View {
    let navigationName: String
    
    var body: some View {
        Button { } label: {
            HStack {
                Text(navigationName)
                    .brSonomaFont(.medium, 15)
                    .foregroundColor(.white)
                Spacer()
                Image("ArrowRightIcon")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(Color("PlaceholderColor"))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity)
            .background(Color("SecondaryContainerColor"))
            
        }
        
    }
}

struct ProfilePhotoSection: View {
    var body: some View {
        VStack {
            AsyncImage(
                url: URL(string: "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
            ) { result in
                result.image?
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
            }
            
            Text("Riad")
                .brSonomaFont(.semiBold, 18)
        }
    }
}

struct PremiumUntilCard: View {
    var body: some View {
        HStack {
            Image("CrownIcon")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(Color("AccentColor"))
            Text("Vous êtes premium jusqu’au 18/12")
                .brSonomaFont(.medium, 14)
                .foregroundColor(Color("AccentColor"))
        }
        .padding(.vertical, 14)
        .frame(maxWidth: .infinity)
        .background(Color(hex: 0x290A14))
        .clipShape(RoundedRectangle(cornerRadius: 32))
    }
}

#Preview {
    ProfileView()
        .preferredColorScheme(.dark)
}
