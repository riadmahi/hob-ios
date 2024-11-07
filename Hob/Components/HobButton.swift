//
//  HobButton.swift
//  Hob
//
//  Created by Riad on 07/11/2024.
//

import SwiftUI

struct HobButton: View {
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
                .foregroundColor(.black)
                .shadow(radius: 5)
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                .frame(maxWidth: width, minHeight: 52)
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(hex:0xFE65EC), Color(hex: 0xFFEDFE), Color(hex: 0xFF7BB8)]), startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            
        }
        .shadow(color: Color(hex: 0xFF99F3), radius: 4)
        .disabled(disabled)
        .opacity(disabled ? 0.4 : 1)

    }
}


#Preview {
    HobButton(text: "Hello") { }
}
