//
//  BiographyView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct BiographyView: View {
    @State var biography: String = ""
    
    var body: some View {
        VStack(spacing: 48) {
            AuthStepHeader(
                screenName: "Inscription",
                displayName: "Ajoute ta description"
            )
            VStack {
                TextField(
                    "Écris ici une présentation de ta personne et tes intentions...",
                    text: $biography,
                    axis: .vertical
                )
                .lineLimit(4...)
                .font(.brSonomaFont(.semiBold, 16))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 16)
            .background(Color("SecondaryContainerColor"))
            .clipShape(RoundedRectangle(cornerRadius: 10))

            HobButton(text: "Suivant", width: .infinity) {
                
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    BiographyView()
        .preferredColorScheme(.dark)
}
