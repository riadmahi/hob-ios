//
//  CheckCard.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct CheckCard: View {
    var label: String
    var selected: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .strokeBorder(selected ? Color("AccentColor") : Color("PlaceholderColor"), lineWidth: selected ? 2.5 : 2)
                        .frame(width: 28, height: 28)
                    
                    if selected {
                        Image(systemName: "checkmark")
                            .foregroundColor(Color("AccentColor"))
                            .font(.system(size: 14, weight: .bold))
                    }
                }

                Text(label)
                    .brSonomaFont(.semiBold, 16)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 8)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(selected ? Color("ContainerColor") : Color("SecondaryContainerColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selected ? Color.white : Color.clear, lineWidth: 3)
            )
            .cornerRadius(10)
        }
    }
}

#Preview {
    VStack {
        CheckCard(label: "Option 1") {
            // Action pour Option 1
        }

        CheckCard(label: "Option 2", selected: true) {
            // Action pour Option 2
        }
    }
    .preferredColorScheme(.dark)
}
