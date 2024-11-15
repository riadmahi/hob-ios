//
//  SpiritualityImportanceView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct SpiritualityImportanceView: View {
    var importanceList = ["Essentielle", "Importante", "Peu importante", "Pas importante"]
    @State private var selectedImportance: String? = nil
    let next: () -> Void
    let back: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button(action: back) {
                    Image("ArrowLeftIcon")
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
            }
            VStack(spacing: 48) {
                AuthStepHeader(
                    screenName: "Valeurs et priorités",
                    displayName: "Quelle importance accordez-vous à la religion dans une relation ?"
                )
            }
            VStack(spacing: 12){
                ForEach(importanceList, id: \.self) { importance in
                    RadioCard(
                        label: importance,
                        selected: self.selectedImportance == importance) {
                            selectedImportance = importance
                            next()
                        }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    SpiritualityImportanceView(next: { }, back: { })
        .preferredColorScheme(.dark)
}


