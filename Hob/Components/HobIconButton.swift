//
//  HobIconButton.swift
//  Hob
//
//  Created by Riad on 13/11/2024.
//

import SwiftUI

struct HobIconButton: View {
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
                    LinearGradient(gradient: Gradient(colors: [Color(hex:0xFE65EC), Color(hex: 0xFFAFF6), Color(hex: 0xFF7BB8)]), startPoint: .leading, endPoint: .trailing)
                    
                )
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                )
                .clipShape(Circle())
        }
        .shadow(color: Color(hex: 0xFF99F3), radius: 4)
        .disabled(disabled)
        .opacity(disabled ? 0.4 : 1)

    }
}


#Preview {
    HobIconButton(iconName: "CheckIcon") { }
}

