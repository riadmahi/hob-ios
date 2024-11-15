//
//  ValuesView.swift
//  Hob
//
//  Created by Riad on 14/11/2024.
//

import SwiftUI

struct ValuesView: View {
    let values = ["Famille", "Respect", "Honnêteté", "Ambition", "Compassion", "Tradition", "Éducation", "Spiritualité"]
    
    @State private var selectedValues: Set<String> = []
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
                    screenName: "Valeurs et priorités",
                    displayName: "Quelles sont les valeurs qui vous tiennent le plus à cœur ?",
                    subtitle: "(choisis jusqu’à 3)"
                )
            }
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(values, id: \.self) { value in
                        CheckCard(
                            label: value,
                            selected: selectedValues.contains(value)
                        ) {
                            toggleSelection(for: value)
                        }
                    }
                }
            }
            
            HobButton(text: "Suivant", width: .infinity) {
                print("Valeurs sélectionnées : \(selectedValues)")
                next()
            }
            .disabled(selectedValues.isEmpty) 
            
            Spacer()
        }
        .padding(.horizontal, 12)
    }
    
    private func toggleSelection(for value: String) {
        if selectedValues.contains(value) {
            selectedValues.remove(value)
        } else {
            if selectedValues.count < 3 {
                selectedValues.insert(value)
            }
        }
    }
}
