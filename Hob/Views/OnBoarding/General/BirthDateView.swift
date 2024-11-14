//
//  BirthDateView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct BirthDateView: View {
    @State private var birthDate = Date.now

    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Indique ta date de naissance"
            )
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                EmptyView()
            }
            .datePickerStyle(.wheel)
            .labelsHidden()
            .aspectRatio(contentMode: .fill)
            
            HobButton(text: "Suivant", width: .infinity) {
                
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    BirthDateView()
        .preferredColorScheme(.dark)
}


