//
//  MainTopBar.swift
//  Hob
//
//  Created by Riad on 13/11/2024.
//

import SwiftUI

struct MainTopBar: View {
    let profile: Profile
    @State private var showProfileSheet = false

    var body: some View {
        HStack(alignment: .center) {
            Button {
                showProfileSheet.toggle()
            } label: {
                HStack(spacing: 8) {
                    ProfilePhoto(imageUrl: "https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", size: 45)
                    Text(profile.name ?? "Inconnu")
                        .brSonomaFont(.semiBold, 15)
                        .foregroundColor(.white)
                }
            }
            Spacer()
            
            HStack {
                Text("Nouveaux profils dans ")
                    .brSonomaFont(.regular, 13)
                
                Text("6:34:56s")
                    .brSonomaFont(.semiBold, 13)
            }
        }
        .padding(.horizontal, 12)
        .frame(maxWidth: .infinity, maxHeight: 50)
        .sheet(isPresented: $showProfileSheet) {
            ProfileView(profile: profile)
                .background(Color(.black))
        }
    }
}

