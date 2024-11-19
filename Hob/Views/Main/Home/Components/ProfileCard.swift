//
//  ProfileCard.swift
//  Hob
//
//  Created by Riad on 11/11/2024.
//

import SwiftUI

struct ProfileCard: View {
    @State var showProfile: Bool = false
    var body: some View {
        ZStack(alignment: .bottom) {
            Carousel(photos: mockProfile.photos!)
            VStack(spacing: 4) {
                HStack(spacing: 8) {
                    Text(mockProfile.name!)
                        .brSonomaFont(.bold, 24)
                    Text("22 ans")
                        .brSonomaFont(.regular, 18)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("à 22km, \(mockProfile.job!)")
                    .brSonomaFont(.regular, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(mockProfile.biography!)
                    .brSonomaFont(.medium, 15)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 24)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 24)
        }
        .frame(maxWidth: .infinity, maxHeight: 600)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .onTapGesture {
            showProfile = true
        }
        .navigationDestination(isPresented: $showProfile) {
            ViewProfileView()
        }
    }
}

#Preview {
    ProfileCard()
        .preferredColorScheme(.dark)
}
