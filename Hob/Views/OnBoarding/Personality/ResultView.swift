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
            Text(category.name)
                .brSonomaFont(.bold, 24)
                .padding(.top, 40)

            Text(category.description)
                .brSonomaFont(.regular, 18)
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
