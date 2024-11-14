//
//  GenderView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct GenderView: View {
    @State var isWoman: Bool? = nil
    let next: () -> Void
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Général",
                displayName: "Quel est ton genre ?"
            )
            VStack(spacing: 12){
                RadioCard(label: "Femme", selected: isWoman ?? false) {
                    isWoman = true
                    next()
                }
                RadioCard(label: "Homme", selected: !(isWoman ?? true)) {
                    isWoman = false
                    next()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    GenderView() { }
        .preferredColorScheme(.dark)
}

