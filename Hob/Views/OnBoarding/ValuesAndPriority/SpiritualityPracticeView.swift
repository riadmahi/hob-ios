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
    @Binding var selectedPractice: String?
    let next: () -> Void
    let back: () -> Void

    var body: some View {
        VStack(spacing: 48) {
            VStack(spacing: 12) {
                HStack {
                    Button(action: back) {
                        Image("ArrowLeftIcon")
                            .resizable()
                            .frame(width: 32, height: 32)
                    }
                    Spacer()
                }
                AuthStepHeader(
                    screenName: "Valeurs et priorités",
                    displayName: "Quelle est votre pratique religieuse ?"
                )
            }
            VStack(spacing: 12){
                ForEach(practiceList, id: \.self) { practice in
                    RadioCard(
                        label: practice,
                        selected: self.selectedPractice == practice) {
                            selectedPractice = practice
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
    SpiritualityPracticeView(selectedPractice: .constant(nil) ,next: { }, back: { })
        .preferredColorScheme(.dark)
}


