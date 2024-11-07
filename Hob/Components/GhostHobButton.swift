//
//  GhostButton.swift
//  Hob
//
//  Created by Riad on 07/11/2024.
//

import SwiftUI

struct GhostHobButton: View {
    var text: String
    var textSize: CGFloat = 16
    var cornerRadius: CGFloat = 12
    var width: CGFloat?
    var disabled: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action){
            Text(text)
                .brSonomaFont(.semiBold, textSize)
                .foregroundColor(.white)
                .shadow(radius: 5)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .frame(maxWidth: width, minHeight: 52)
                .background(Color("ContainerColor"))
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color("AccentColor"), lineWidth: 1.5)
                )
        }
        .shadow(color: Color(hex: 0xFF99F3), radius: 4)
        .cornerRadius(12)
        .disabled(disabled)
        .opacity(disabled ? 0.4 : 1)

    }
}


#Preview {
    GhostHobButton(text: "Hello world") {
        
    }
}
