//
//  DisplayNameView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct DisplayNameView: View {
    @State var name: String = ""
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
                    displayName: "Indique ton prénom ou pseudo"
                )
            }
            HobTextField(hint: "Prénom ou pseudo", text: $name)

            HobButton(text: "Suivant", width: .infinity) {
                next()
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    DisplayNameView(next: { }, back: { })
        .preferredColorScheme(.dark)
}
