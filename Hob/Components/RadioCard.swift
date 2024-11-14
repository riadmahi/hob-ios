//
//  RadioCard.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct RadioCard: View {
    var label: String
    var selected: Bool = false
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Circle()
                    .strokeBorder(selected ? Color("AccentColor"): Color("PlaceholderColor"), lineWidth: selected ? 6: 3)
                    .frame(width: 28, height: 28)

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
                        .stroke(selected ? Color.white: Color.clear, lineWidth: 3)
            )
            .cornerRadius(10)

        }
        
    }
}

#Preview {
    VStack{
        RadioCard(label: "Selector") {
            
        }
        
        RadioCard(label: "Selector", selected: true) {
            
        }
    }
}

