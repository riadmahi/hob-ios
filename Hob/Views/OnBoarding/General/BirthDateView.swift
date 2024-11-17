//
//  BirthDateView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct BirthDateView: View {
    @Binding var birthDate: Date
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
                    displayName: "Indique ta date de naissance"
                )
            }
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                EmptyView()
            }
            .datePickerStyle(.wheel)
            .labelsHidden()
            .aspectRatio(contentMode: .fill)
            
            HobButton(text: "Suivant", width: .infinity) {
                next()
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    BirthDateView(birthDate: .constant(Date.now), next: { }, back: { })
        .preferredColorScheme(.dark)
}


