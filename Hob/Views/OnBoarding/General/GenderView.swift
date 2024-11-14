//
//  GenderView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct GenderView: View {
    @State var isWoman: Bool? = nil
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Quel est ton genre ?"
            )
            VStack(spacing: 12){
                RadioCard(label: "Femme", selected: isWoman ?? false) { isWoman = true }
                RadioCard(label: "Homme", selected: !(isWoman ?? true)) { isWoman = false }
            }
            HobButton(text: "Suivant", width: .infinity) {
                
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    GenderView()
        .preferredColorScheme(.dark)
}

