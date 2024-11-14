//
//  ViewProfileView.swift
//  Hob
//
//  Created by Riad on 12/11/2024.
//

import SwiftUI
import WrappingHStack

struct ViewProfileView: View {
    var spectatorMode = false
    @State var note: String = ""

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ZStack(alignment: .bottom) {
                    Carousel(photos: [
                        "https://images.unsplash.com/photo-1552162864-987ac51d1177?q=80&w=2980&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        "https://images.unsplash.com/photo-1727160930825-97245483a509?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0fHx8ZW58MHx8fHx8"
                    ])
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 8) {
                            Text("Safia")
                                .brSonomaFont(.bold, 24)
                            Text("22 ans")
                                .brSonomaFont(.regular, 18)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("à 22km, Banquière")
                            .brSonomaFont(.regular, 15)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 24)
                }
                .frame(height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                SectionCard(title: "Biographie") {
                    Text("Je suis quelqu’un qui aime les échanges authentiques et sincères")
                        .brSonomaFont(.semiBold, 16)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 0)
                    
                    WrappingHStack(["Confiant", "Drôle", "Romantique"], id: \.self) { interest in
                        ProfileTag(tag: interest)
                    }.padding(.top, 6)
                }
                
                SectionCard(title: "Centres d'intérêt (2 en commun)") {
                    WrappingHStack(["Foot", "Café", "Dance"], id: \.self) { interest in
                        ProfileTag(tag: interest)
                    }.padding(.top, 6)
                }
                
                SectionCard(title: "On est dans la même room parceque") {
                    WrappingHStack(["Maroc", "Darija", "Francais", "Islam", "Veut se marier vite"], id: \.self, lineSpacing: 12) { interest in
                        ProfileTag(tag: interest)
                    }.padding(.top, 6)
                }
                
                SectionCard(title: "Envoyer une note") {
                    VStack {
                        TextField(
                            "Écris ici ta note pour Safia",
                            text: $note,
                            axis: .vertical
                        )
                        .lineLimit(4...)
                        .font(.brSonomaFont(.semiBold, 20))
                        .accentColor(Color("AccentColor"))
                        
                        HStack {
                            Spacer()
                            HobIconButton(iconName: "CheckIcon") {
                                
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 12)
        }
    }
}

struct SectionCard<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .brSonomaFont(.semiBold, 14)
                .foregroundColor(Color("AccentColor"))
            content()
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12)
        .padding(.vertical, 16)
        .background(Color("SecondaryContainerColor"))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ViewProfileView()
        .preferredColorScheme(.dark)
}
