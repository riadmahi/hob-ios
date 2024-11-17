//
//  BiographyView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct BiographyView: View {
    @Binding var biography: String
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
                    displayName: "Ajoute ta description"
                )
            }
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

            HobButton(text: "Finaliser", width: .infinity) {
                next()
            }
            Spacer()
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    BiographyView(biography: .constant(""),next: { }, back: { })
        .preferredColorScheme(.dark)
}
