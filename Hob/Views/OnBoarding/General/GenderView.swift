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
    GenderView(next: { }, back: { })
        .preferredColorScheme(.dark)
}

