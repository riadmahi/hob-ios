//
//  SpiritualityView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//


import SwiftUI

struct SpiritualityView: View {
    var religionList = [
        "Islam",
        "Christianisme",
        "Hindouisme",
        "Bouddhisme",
        "Judaïsme",
        "Autre"]
    @Binding var selectedReligion: String?
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
                    displayName: "Quelle est ta religion ?",
                    subtitle: "En répondant à cette question, vous verrez des profils de personnes de la même religion"
                )
            }
            VStack(spacing: 12){
                ForEach(religionList, id: \.self) { religion in
                    RadioCard(
                        label: religion,
                        selected: self.selectedReligion == religion
                    ) {
                        selectedReligion = religion
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
    SpiritualityView(selectedReligion: .constant(nil),next: { }, back: { })
        .preferredColorScheme(.dark)
}
