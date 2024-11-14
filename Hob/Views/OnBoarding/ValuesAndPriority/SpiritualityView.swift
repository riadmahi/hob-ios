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
    @State private var selectedReligion: String? = nil
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Valeurs et priorités",
                displayName: "Quelle est ta religion ?",
                subtitle: "En répondant à cette question, vous verrez des profils de personnes de la même religion"
            )
            VStack(spacing: 12){
                ForEach(religionList, id: \.self) { religion in
                    RadioCard(
                        label: religion,
                        selected: self.selectedReligion == religion
                    ) {
                        selectedReligion = religion
                    }
                }
            }
            HobButton(text: "Suivant", width: .infinity) {
                // Action à définir, par exemple naviguer vers l'étape suivante
                print("Religion sélectionnée : \(selectedReligion ?? "Aucune")")
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}



#Preview {
    SpiritualityView()
        .preferredColorScheme(.dark)
}
