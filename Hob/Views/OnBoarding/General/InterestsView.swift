//
//  InterestView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//
import SwiftUI
import WrappingHStack

struct InterestsView: View {
    @State private var interests: [String] = []
    @Binding var selectedInterests: [String]
    let next: () -> Void
    let back: () -> Void
    private let maxSelection = 15

    var body: some View {
        VStack {
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
                    displayName: "Quelles sont tes centres d'intérêts ? (\(selectedInterests.count)/\(maxSelection))",
                    subtitle: "Sélectionnez jusqu'à \(maxSelection) intérêts"
                )
                .padding()
            }

            ScrollView {
                WrappingHStack(interests, id: \.self, lineSpacing: 12) { interest in
                    InterestBadge(
                        tag: interest,
                        isSelected: selectedInterests.contains(interest)
                    ) {
                        toggleSelection(interest)
                    }
                }
                .padding()
            }

            HobButton(text: "Suivant", width: .infinity) {
                next()
            }
            .padding(.horizontal, 12)
        }
        .onAppear {
            loadInterests()
        }
    }

    private func loadInterests() {
        if let url = Bundle.main.url(forResource: "interests", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedInterests = try JSONDecoder().decode([String].self, from: data)
                self.interests = decodedInterests
            } catch {
                print("Erreur de chargement des intérêts : \(error)")
            }
        } else {
            print("Fichier interests.json non trouvé.")
        }
    }

    private func toggleSelection(_ interest: String) {
        if let index = selectedInterests.firstIndex(of: interest) {
            selectedInterests.remove(at: index)
        } else {
            if selectedInterests.count < maxSelection {
                selectedInterests.append(interest)
            }
        }
    }
}


struct InterestBadge: View {
    let tag: String
    var isSelected: Bool = false
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Text(tag)
                    .brSonomaFont(.medium, 14)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? Color("ContainerColor") : Color("SecondaryContainerColor"))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isSelected ? Color.white : .clear, lineWidth: 1)
            )
        }
    }
}
