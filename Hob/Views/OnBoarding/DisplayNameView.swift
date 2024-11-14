//
//  DisplayNameView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct DisplayNameView: View {
    @State var name: String = ""
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Indique ton prénom ou pseudo"
            )
            HobTextField(hint: "Prénom ou pseudo", text: $name)

            HobButton(text: "Suivant", width: .infinity) {
                
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    DisplayNameView()
        .preferredColorScheme(.dark)
}
