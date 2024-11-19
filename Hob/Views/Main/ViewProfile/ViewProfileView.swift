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
                    Carousel(photos: mockProfile.photos!)
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 8) {
                            Text(mockProfile.name!)
                                .brSonomaFont(.bold, 24)
                            Text("22 ans")
                                .brSonomaFont(.regular, 18)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("à 22km, \(mockProfile.job!)")
                            .brSonomaFont(.regular, 15)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.horizontal, 12)
                    .padding(.bottom, 48)

                }
                .frame(height: 600)
                .clipShape(RoundedRectangle(cornerRadius: 16))

                SectionCard(title: "Biographie") {
                    Text(mockProfile.biography!)
                        .brSonomaFont(.semiBold, 16)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 0)
                    
                    WrappingHStack(mockProfile.origins!, id: \.self) { origin in
                        ProfileTag(tag: origin)
                    }.padding(.top, 6)
                }
                
                SectionCard(title: "Personnalité") {
                    Text("‛\(getPersonnalityName(forCategoryId: mockProfile.personality!) ?? "")‛")
                            .brSonomaFont(.semiBold, 16)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 0)
                    HStack(spacing: 12) {
                        Image(getPersonalityImageName(forCategoryId: mockProfile.personality!))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text("\(mockProfile.name!) \(getPersonnalityDescription(forCategoryId: mockProfile.personality!) ?? "Inconnu")")
                            .brSonomaFont(.medium, 14)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 0)
                        
                    }
                }
                
                
                SectionCard(title: "Spiritualité") {
                    WrappingHStack(lineSpacing: 6) {
                        ProfileTag(tag: mockProfile.spirituality!)
                        ProfileTag(tag: "Je suis quelqu'un de \(mockProfile.spiritualityPractice!.lowercased())")
                        ProfileTag(tag: "La spiritualité est \(mockProfile.spiritualityImportance!.lowercased()) selon moi")
                    }.padding(.top, 6)
                }
                
                SectionCard(title: "Centres d'intérêt") {
                    WrappingHStack(mockProfile.interests!, id: \.self, lineSpacing: 6) { interest in
                        ProfileTag(tag: interest)
                    }.padding(.top, 6)
                }
                
                if !spectatorMode {
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
                
                VStack(spacing: 24) {
                    GhostHobButton(text: "Ne plus voir le profil de \(mockProfile.name!)", width: .infinity) { }
                    ErrorButton(text: "Signaler \(mockProfile.name!)", width: .infinity) { }
                }
                .padding(.top, 132)
            }
            .padding(.horizontal, 12)
            
            
        }
    }
    
    func getPersonnalityDescription(forCategoryId id: String) -> String? {
        if let url = Bundle.main.url(forResource: "personalities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let quiz = try JSONDecoder().decode(QuizData.self, from: data)
                return getViewDescription(forCategoryId: id, from: quiz.categories)
            } catch {
                print("Erreur de chargement du fichier JSON : \(error)")
            }
        }
        return nil
    }
    
    func getPersonnalityName(forCategoryId id: String) -> String? {
        if let url = Bundle.main.url(forResource: "personalities", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let quiz = try JSONDecoder().decode(QuizData.self, from: data)
                return getPersonnalityName(forCategoryId: id, from: quiz.categories)
            } catch {
                print("Erreur de chargement du fichier JSON : \(error)")
            }
        }
        return nil
    }
    
    
    func getPersonalityImageName(forCategoryId id: String) -> String {
        switch id {
        case "SociableInspirant":
            return "SocialIllustration"
        case "RéfléchiSpirituel":
            return "SpirituallyIllustration"
        case "DynamiqueÉquilibré":
            return "DynamicIllustration"
        case "TranquilleBienveillant":
            return "KindIllustration"
        default:
            return "KindIllustration"
        }
    }
    
    func getViewDescription(forCategoryId id: String, from categories: [Category]) -> String? {
        if let category = categories.first(where: { $0.id == id }) {
            return category.view_description
        }
        return nil
    }
    
    func getPersonnalityName(forCategoryId id: String, from categories: [Category]) -> String? {
        if let category = categories.first(where: { $0.id == id }) {
            return category.name
        }
        return nil
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
