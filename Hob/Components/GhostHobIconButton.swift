//
//  HobIconButton 2.swift
//  Hob
//
//  Created by Riad on 13/11/2024.
//
import SwiftUI

struct GhostHobIconButton: View {
    var iconName: String
    var iconSize: CGFloat = 24
    var padding : CGFloat = 12
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action){
            Image(iconName)
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(.white)
                .shadow(radius: 5)
                .padding(.all, padding)
                .background(
                    Color("ContainerColor")
                )
                .overlay(
                    Circle()
                        .stroke(Color("AccentColor"), lineWidth: 1.5)
                )
                .clipShape(Circle())
        }
        .disabled(disabled)
        .opacity(disabled ? 0.4 : 1)

    }
}


#Preview {
    GhostHobIconButton(iconName: "CheckIcon") { }
}
