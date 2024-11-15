//
//  JobView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct JobView: View {
    @State var job: String = ""
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
                    displayName: "Indique ton emploi actuel"
                )
            }
            HobTextField(hint: "Emploi (sans emploi, étudiant, etc.)", text: $job)

            HobButton(text: "Suivant", width: .infinity) {
                next()
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    JobView(next: { }, back: { })
        .preferredColorScheme(.dark)
}
