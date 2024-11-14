//
//  ResultView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct PersonalityResultView: View {
    let category: Category
    let onRestart: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            var imageName: String {
                switch category.id {
                case "SociableInspirant":
                    return "SocialIllustration"
                case "RéfléchiSpirituel":
                    return "SpirituallyIllustration"
                case "DynamiqueÉquilibré":
                    return "DynamicIllustration"
                case "TranquilleBienveillant":
                    return "KindIllustration"
                default:
                    return "KindIllustration"
                }
            }
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150) // Ajustez la taille selon vos besoins
                .transition(.opacity) // Transition pour l'animation d'apparition
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Color(hex: 0xFF99F3), radius: 4)
                .padding(.top, 24)

            Text(category.name)
                .brSonomaFont(.bold, 24)
                .padding(.top, 40)
            
            Text(category.description)
                .brSonomaFont(.regular, 16)
                .lineSpacing(1.4)
                .foregroundColor(Color("PlaceholderColor"))
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            HobButton(text: "Sauvegarder", width: .infinity) {
                dismiss()
            }
            
            GhostHobButton(text: "Recommencer le Quiz", width: .infinity) {
                onRestart()
            }
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 12)
    }
}
