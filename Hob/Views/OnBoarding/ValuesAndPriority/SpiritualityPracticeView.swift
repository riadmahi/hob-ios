//
//  SpiritualityPractice.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct SpiritualityPracticeView: View {
    @State var isWoman: Bool? = nil
    var practiceList = ["Je suis en chemin", "Pratiquant(e) modéré(e)", "Pratiquant(e) engagé(e)", "Très pratiquant(e)"]
    @State private var selectedPractice: String? = nil
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Valeurs et priorités",
                displayName: "Quelle est votre pratique religieuse ?"
            )
            VStack(spacing: 12){
                ForEach(practiceList, id: \.self) { practice in
                    RadioCard(
                        label: practice,
                        selected: self.selectedPractice == practice) {
                            selectedPractice = practice
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
    SpiritualityPracticeView()
        .preferredColorScheme(.dark)
}


