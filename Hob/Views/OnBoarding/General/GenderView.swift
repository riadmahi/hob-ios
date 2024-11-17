//
//  GenderView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct GenderView: View {
    @Binding var gender: Gender?
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
                    screenName: "Général",
                    displayName: "Quel est ton genre ?"
                )
            }
            VStack(spacing: 12){
                RadioCard(label: "Femme", selected: gender == .woman) {
                    gender = .woman
                    next()
                }
                RadioCard(label: "Homme", selected: gender == .man) {
                    gender = .man
                    next()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    GenderView(gender: .constant(nil), next: { }, back: { })
        .preferredColorScheme(.dark)
}
