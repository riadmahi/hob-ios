//
//  JobView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct JobView: View {
    @State var job: String = ""
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Indique ton emploi actuel"
            )
            HobTextField(hint: "Emploi (sans emploi, étudiant, etc.)", text: $job)

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
