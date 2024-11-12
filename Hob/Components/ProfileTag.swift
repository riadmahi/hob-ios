//
//  ProfileTag.swift
//  Hob
//
//  Created by Riad on 12/11/2024.
//

import SwiftUI

struct ProfileTag: View {
    let tag: String
    var isSelected: Bool = false
    var body: some View {
        HStack {
            Text(tag)
                .brSonomaFont(.medium, 13)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            isSelected ? LinearGradient(gradient: Gradient(colors: [Color(hex: 0xFF4CEA), Color(hex: 0xFF91F2)]), startPoint: .bottomLeading, endPoint: .topTrailing) : LinearGradient(gradient: Gradient(colors: [Color(hex: 0x1F111B).opacity(0.45)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 24))
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(isSelected ? Color.white : .clear, lineWidth: 1.5)
        )
        .shadow(color:isSelected ? Color(hex: 0xFF99F3) : .clear, radius: 2)
    }
}


#Preview {
    VStack {
        ProfileTag(tag: "Randonnée ⛰️")
        ProfileTag(tag: "Randonnée ⛰️", isSelected: true)
    }
    .preferredColorScheme(.dark)
}
