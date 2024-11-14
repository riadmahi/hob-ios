//
//  SpiritualityImportanceView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct SpiritualityImportanceView: View {
    @State var isWoman: Bool? = nil
    var importanceList = ["Essentielle", "Importante", "Peu importante", "Pas importante"]
    @State private var selectedImportance: String? = nil
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Valeurs et priorités",
                displayName: "Quelle importance accordez-vous à la religion dans une relation ?"
            )
            VStack(spacing: 12){
                ForEach(importanceList, id: \.self) { importance in
                    RadioCard(
                        label: importance,
                        selected: self.selectedImportance == importance) {
                            selectedImportance = importance
                        }

                }
            }
            HobButton(text: "Suivant", width: .infinity) {
                
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    SpiritualityImportanceView()
        .preferredColorScheme(.dark)
}


